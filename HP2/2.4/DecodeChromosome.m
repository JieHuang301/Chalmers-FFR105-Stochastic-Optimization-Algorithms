function outputOfChromosome = DecodeChromosome(chromosome, inputOfFunction, numVariableRegister, constant)
    
    maxConstant = 100;
    lengthOfChromosome = length(chromosome);
    numOfInstructions = lengthOfChromosome/4;
    numOfInputPoints = length(inputOfFunction);

    outputOfChromosome = zeros(numOfInputPoints, 1);
    variable = zeros(1, numVariableRegister);
    variable = [variable, constant];
    
    for i = 1:numOfInputPoints
         variable(1) = inputOfFunction(i);
        for j = 1:numOfInstructions
            switch chromosome(4*j-3) 
                case 1
                    variable(chromosome(4*j-2)) = variable(chromosome(4*j-1)) + variable(chromosome(4*j));
                case 2
                    variable(chromosome(4*j-2)) = variable(chromosome(4*j-1)) - variable(chromosome(4*j));
                case 3
                    variable(chromosome(4*j-2)) = variable(chromosome(4*j-1)) * variable(chromosome(4*j));
                case 4
                    if variable(chromosome(4*j)) == 0
                        variable(chromosome(4*j-2)) = maxConstant;
                    else
                        variable(chromosome(4*j-2)) = variable(chromosome(4*j-1)) / variable(chromosome(4*j));
                    end
            end           
        end
        outputOfChromosome(i) = variable(1);
    end
end

