% First compute the function value, then compute the fitness
% value; see also the problem formulation.

function fitness = EvaluateIndividual(x);
    x_1 = x(1);
    x_2 = x(2);
    fDenominator1 = (1.5 - x_1 + x_1*x_2)^2;
    fDenominator2 = (2.25 - x_1 + x_1*(x_2^2))^2;
    fDenominator3 = (2.625 - x_1 + x_1*(x_2)^3)^2;
    fitness = 1/(fDenominator1 + fDenominator2 + fDenominator3 + 1);
end    
