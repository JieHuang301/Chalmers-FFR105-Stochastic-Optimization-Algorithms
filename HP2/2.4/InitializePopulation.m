function population = InitializePopulation(populationSize,minInitialChromosomeLength,maxInitialChromosomeLength, numVariableRegister, constant)

    population = [];
    maxNumOfInstructions = maxInitialChromosomeLength/4;
    minNumOfInstructions = minInitialChromosomeLength/4;
    numConstantRegister = length(constant);
    numTotalRegister = numVariableRegister + numConstantRegister;
    for i = 1:populationSize
        numberOfInstructions = randi([minNumOfInstructions, maxNumOfInstructions]);
        chromosomeLength = 4 * numberOfInstructions;
        tmpChromosome = zeros(1, chromosomeLength);
        for j = 1:numberOfInstructions
            tmpChromosome(4*j-3) = randi(4); % The operator
            tmpChromosome(4*j-2) = randi(numVariableRegister); % The variable
            tmpChromosome(4*j-1) = randi(numTotalRegister); % The operand
            tmpChromosome(4*j) = randi(numTotalRegister); % The operand
            tmpIndividual = struct('Chromosome',tmpChromosome);        
        end
        population = [population; tmpIndividual];
    end

