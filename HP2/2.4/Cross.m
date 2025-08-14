function newIndividuals = Cross(individual1, individual2)
    
    lengthNewIndividuals = inf;
    while lengthNewIndividuals > 400
        legenthOfIndividual1 = length(individual1);
        numOfInstructions1 = legenthOfIndividual1/4;
        legenthOfIndividual2 = length(individual2);
        numOfInstructions2 = legenthOfIndividual2/4;
    
        crossoverPoint11 = 4 * (1 + fix(rand*(numOfInstructions1-2)));
        crossoverPoint12 = 4 * randi([crossoverPoint11/4+1, numOfInstructions1-1]);
        crossoverPoint21 = 4 * (1 + fix(rand*(numOfInstructions2-2)));
        crossoverPoint22 = 4 * randi([crossoverPoint21/4+1, numOfInstructions2-1]);
    
        newIndividuals1 = [individual1(1:crossoverPoint11), individual2(crossoverPoint21+1:crossoverPoint22), individual1(crossoverPoint12+1:end)];
        newIndividuals2 = [individual2(1:crossoverPoint21), individual1(crossoverPoint11+1:crossoverPoint12), individual2(crossoverPoint22+1:end)];
        
        tmpIndividuals1 = struct('Chromosome',newIndividuals1);
        tmpIndividuals2 = struct('Chromosome',newIndividuals2);
    
        newIndividuals = [tmpIndividuals1; tmpIndividuals2];
        lengthNewIndividuals = max(length(newIndividuals1), length(newIndividuals2));
    end
end
