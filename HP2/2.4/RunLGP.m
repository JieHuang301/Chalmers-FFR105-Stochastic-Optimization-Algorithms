%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Function fitting using LGP 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

% Load data.
Data = LoadFunctionData;
inputOfFunction = Data(:,1);
functionValue = Data(:,2);
numOfInput = length(inputOfFunction);

% Parameter Setting
populationSize = 10000;
minInitialChromosomeLength = 12;
maxInitialChromosomeLength = 200;

numVariableRegister = 10;%
constant = [0.1, -1, -4, 3, 15, 0.7, 1, 7]; %

upperLimitOfChromosomeLength = 400;
softLimitOfChromosomeLength = 300;%

tournamentSize = 5;
tournamentProbability = 0.5;
crossoverProbability = 0.4; 
% mutationProbability = 0.1;%
mutationNum = 5;

requiredError = 0.01;

iteration = 0;
maxFitness = 0;
lowestError = 10;
lowestErrorOld = 11;

% Initialization
population = InitializePopulation(populationSize, minInitialChromosomeLength, maxInitialChromosomeLength, ...
                                        numVariableRegister, constant);

while lowestError > requiredError
   
    errorList = zeros(populationSize, 1);
    fitnessList = zeros(populationSize, 1);

    iteration = iteration + 1;
    for i = 1:populationSize
        chromosome = population(i).Chromosome;
        outputOfChromosome = DecodeChromosome(chromosome, inputOfFunction, numVariableRegister, constant);
        errorList(i) = GetTotalError(outputOfChromosome, functionValue);

        if length(population(i).Chromosome) > softLimitOfChromosomeLength %
            fitnessList(i) = 1/errorList(i) * 0.8;
        else
            fitnessList(i) = 1/errorList(i);
        end
    
        if fitnessList(i) > maxFitness
            lowestError = errorList(i);
            maxFitness = fitnessList(i);
            iBestIndividual = i;
            bestChromosome = population(i).Chromosome;
        end
    end
    
    temporaryPopulation = population;
    for i = 1:2:populationSize
        % Tournament Select
        index1 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        index2 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
    
        % Crossover
        r = rand;
        if r < crossoverProbability
            individual1 = population(index1).Chromosome;
            individual2 = population(index2).Chromosome;
            newIndividualPair = Cross(individual1, individual2);
            temporaryPopulation(i).Chromosome = newIndividualPair(1).Chromosome;
            temporaryPopulation(i+1).Chromosome = newIndividualPair(2).Chromosome;
        else
            temporaryPopulation(i).Chromosome = population(index1).Chromosome;
            temporaryPopulation(i+1).Chromosome = population(index2).Chromosome;
        end
    
    end
    
    temporaryPopulation(1).Chromosome = population(iBestIndividual).Chromosome; % Elitism
        % Mutation
        for i = 2:populationSize * 0.65
            tempIndividual = Mutate(temporaryPopulation(i).Chromosome, mutationNum, numVariableRegister, constant);
            temporaryPopulation(i).Chromosome = tempIndividual;
        end
    population = temporaryPopulation; 
       
    % Print the new lowest error.
    if lowestError < lowestErrorOld
        fprintf('Iteration: %d, the lowest error: %.5f. \n', iteration, lowestError);
        lowestErrorOld = lowestError;
        lastIteration = iteration;
        
        % Save the new best chromosome.
        file = fopen('BestChromosome.m', 'w');
        fprintf(file, 'function  bestChromosome = BestChromosome \n bestChromosome = [');
        fprintf(file, '%g ', bestChromosome);
        fprintf(file, '];');
        fclose(file);
    end
    
     % Change the mutation rate when lowest < 0.1.
     % Raise the mutation rate if there is no progress in 1000 iterations.
    if lowestError >= 0.55
        if iteration-lastIteration > 1000
            mutationNum = min(mutationNum * 1.5, 35);
        else 
            mutationNum = 5;
        end
    elseif  lowestError < 0.55 && lowestError > 0.35
        if iteration-lastIteration > 100
            mutationNum = min(mutationNum * 2, 50);
        else 
            mutationNum =  10/lowestError ;
        end
    else
        if iteration-lastIteration > 100
            mutationNum = min(mutationNum * 2, 50);
        else 
            mutationNum = lowestError * 20;
        end
    end
    
    % Raise the mutation rate if there is no progress in 1000 iterations.
    if iteration-lastIteration > 1000
        mutationNum = mutationNum * 1.5;
    else 
        mutationNum = 5;
    end

end

disp('The best Chromosome is');
disp(bestChromosome);

save('BestChromosome.mat', "bestChromosome");