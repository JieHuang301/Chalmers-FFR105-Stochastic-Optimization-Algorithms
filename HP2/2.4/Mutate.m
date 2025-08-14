function mutatedIndividual = Mutate(individual, mutationNum, numVariableRegister, constant)
    
    numConstantRegister = length(constant);
    numOfRegister = numConstantRegister + numVariableRegister;
    lengthOfIndividual = length(individual);
     
    mutationProbability = max(mutationNum/lengthOfIndividual, 0.02);
  
    mutatedIndividual = individual;

    for i = 1:lengthOfIndividual
        location = mod(i, 4);
        r = rand;
        if r < mutationProbability
            switch location
                case 1
                    mutatedIndividual(i) = randi(4);
                case 2
                    mutatedIndividual(i) = randi(numVariableRegister);
                case 3
                    mutatedIndividual(i) = randi(numOfRegister);
                case 0 
                    mutatedIndividual(i) = randi(numOfRegister);
            end 
        end
    end

end

