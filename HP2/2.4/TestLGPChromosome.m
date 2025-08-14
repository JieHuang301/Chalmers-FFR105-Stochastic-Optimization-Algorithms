clear all;
clc;

numVariableRegisters = 10;
constant = [0.1, -1, -4, 3, 15, 0.7, 1, 7]; 
bestChromosome = BestChromosome;
Data = LoadFunctionData;
inputOfFunction = Data(:,1);
outputOfFunction = Data(:,2);
outputOfChromosome = DecodeChromosome(bestChromosome, inputOfFunction, numVariableRegisters, constant);
error = GetTotalError(outputOfChromosome, outputOfFunction);
fprintf('Error is %.5f. \n', error);
fitnessValue = 1/error;
fprintf('Fitness value is %.5f. \n', fitnessValue);

g = GetLastFunction(bestChromosome);
disp(g);

hold on;
plot(inputOfFunction, outputOfFunction);
plot(inputOfFunction, outputOfChromosome);
xlabel('x');
ylabel('g');
grid on;
legend('Original function', 'Function found by LGP');
title("Orginal function and output from LGP");


