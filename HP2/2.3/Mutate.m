function mutatedIndividual = Mutate(individual, mutationProbability);
    
    numberOfGenes = size(individual, 2);
    mutatedIndividual = individual;

    for i = 1:numberOfGenes
        r = rand;
        if r < mutationProbability
            mutatedIndividual(i) = rand;
        end
    end

end

