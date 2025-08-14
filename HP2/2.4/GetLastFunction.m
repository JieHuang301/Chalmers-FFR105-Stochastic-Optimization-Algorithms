function g = GetLastFunction(bestChromosome)
  
    numOfInstructions = length(bestChromosome)/4;
    numVariableRegister = 10;
    constant = [0.1, -1, -4, 3, 15, 0.7, 1, 7]; 
    syms x;
    variableRegister = sym(zeros(1, numVariableRegister)); 
    variableRegister(1) = x; 
 
    for j = 1:numOfInstructions
        operator = bestChromosome(4*j-3);
        destination = bestChromosome(4*j-2);
        operands1 = bestChromosome(4*j-1);
        operands2 = bestChromosome(4*j);
        if operands1 <= numVariableRegister
            operand1Value = variableRegister(operands1);
        else
            operand1Value = constant(operands1 - numVariableRegister);
        end

        if operands2 <= numVariableRegister
            operand2Value = variableRegister(operands2);
        else
            operand2Value = constant(operands2 - numVariableRegister);
        end

        switch operator
            case 1
                variableRegister(destination) = operand1Value + operand2Value;
            case 2
                variableRegister(destination) = operand1Value - operand2Value;
            case 3
                variableRegister(destination) = operand1Value * operand2Value;
            case 4
                if operand2Value == 0
                    operand2Value = 100;
                else
                    variableRegister(destination) = operand1Value / operand2Value;
                end
        end
    end
    g = simplifyFraction(variableRegister(1));

end

