%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  FFNN optimization.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear all;
clc;

% Parameter cannot be changed.
DISTANCE = 1000;
tempMax = 750;
velocityMax = 25;
velocityMin = 1;
alphaMax = 10;
velocityStart = 20;
gearStart = 7;
tempStart = 500;
weightMax = 5;
constantOfActivationFunction = 1;
numOfInput = 3;
numOfOutput = 2;

% Parameter can be changed.
detlaTime = 0.01;
numOfHidden = 5;
populationSize = 100;

mutationProbability = 0.02;
crossoverProbability = 0.4;
tournamentProbability = 0.6;
tournamentSize = 5;
numOfGenerations = 200;

% Initialization
numberOfGenes = (numOfInput+1)*numOfHidden + (numOfHidden+1)*numOfOutput;
population = InitializePopulation(populationSize, numOfInput, numOfHidden, numOfOutput);
maxFitnessOld = -1;
maxFitness = 0;
iteration = 0;

nTraining = 10;
nValidation = 5;

fitnessListBestTraining = zeros(1,numOfGenerations);
fitnessListValidation = zeros(1, numOfGenerations);
fitnessValueValidation = zeros(1,nValidation);
averageFitnessValueTraining = zeros(1, numOfGenerations);
bestChromosomeList = zeros(numOfGenerations, numberOfGenes);

for nGeneration = 1:numOfGenerations
    iteration = iteration + 1;
    fitnessListTraining = zeros(1, populationSize); 
    fitnessValueTraining = zeros(1,nTraining);
    % Training.    
    iDataSet = 1;
 
    for i = 1:populationSize
        fitnessValueTraining = zeros(1,nTraining);
        for iTraining = 1:nTraining % 10 times Training
            iSlope = iTraining;
            fitnessValueTraining(iTraining) = EvaluateChromosome(population(i,:), detlaTime, numOfHidden, iDataSet, iSlope);            
        end 
        fitnessListTraining(i) = sum(fitnessValueTraining)/length(fitnessValueTraining); % Get the average of 10 training fitness value.
        % Get the best chromosome.
        if fitnessListTraining(i) > maxFitness
            maxFitness = fitnessListTraining(i);
            iBestIndividual = i;
            bestChromosome = population(i,:);
        end
    end
    bestChromosomeList(nGeneration,:) = bestChromosome;
    averageFitnessValueTraining(nGeneration) = sum(fitnessListTraining)/length(fitnessListTraining);
    
    % Run GA.
    temporaryPopulation = population;
    for i = 1:2:populationSize
        index1 = TournamentSelect(fitnessListTraining, tournamentProbability, tournamentSize);
        index2 = TournamentSelect(fitnessListTraining, tournamentProbability, tournamentSize);
        % Crossover
        r = rand;
        if r < crossoverProbability
            individual1 = population(index1,:);
            individual2 = population(index2,:);
            newIndividualPair = Cross(individual1, individual2);
            temporaryPopulation(i,:) = newIndividualPair(1,:);
            temporaryPopulation(i+1,:) = newIndividualPair(2,:);
        else
            temporaryPopulation(i,:) = population(index1,:);
            temporaryPopulation(i+1,:) = population(index2,:);
        end    
    end   
     temporaryPopulation(1,:) = population(iBestIndividual,:); % Elitism
     % Mutation
     for i = 2:populationSize 
         tempIndividual = Mutate(temporaryPopulation(i,:), mutationProbability);
         temporaryPopulation(i,:) = tempIndividual;
     end
    population = temporaryPopulation; 

    if maxFitness > maxFitnessOld        
        maxFitnessOld = maxFitness;
        lastIteration = iteration;
        fprintf('Iteration: %d, the training fitness: %.5f. \n', iteration, maxFitness);
    end

    % Collect the best training fitness.
    fitnessListBestTraining(nGeneration) = maxFitness;
    
    % Validation.
    iDataSet = 2;    
    for iValidation = 1:nValidation
        iSlope = iValidation;          
        % Collect the best validation fitness.
        fitnessValueValidation(iValidation) = EvaluateChromosome(bestChromosome, detlaTime, numOfHidden, iDataSet, iSlope);
    end
    fitnessListValidation(nGeneration) = sum(fitnessValueValidation)/length(fitnessValueValidation);
    fprintf('Validation fitness: %.5f. \n',  fitnessListValidation(nGeneration));
    
    if abs(fitnessListValidation(nGeneration) -fitnessListBestTraining(nGeneration)) < 1000
        if fitnessListBestTraining(nGeneration) > 20000 
            file = fopen('BestChromosome.m', 'w');
            fprintf(file, 'function bestChromosome = BestChromosome \n bestChromosome = [');
            fprintf(file, '%g ', bestChromosomeList(nGeneration,:));
            fprintf(file, '];');
            fclose(file);
        end
    end

end

hold on;
plot(1:nGeneration, fitnessListBestTraining); 
plot(1:nGeneration, fitnessListValidation);
legend('Training','Validation');
xlabel('Number of iterations');
ylabel('Fitness Value');


         