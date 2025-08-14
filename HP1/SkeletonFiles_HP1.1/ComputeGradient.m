% This function should return the gradient of f_p = f + penalty.
% You may hard-code the gradient required for this specific problem.

function gradF = ComputeGradient(x,mu)
    gradF = zeros(1,2);
    x_1 = x(1); 
    x_2 = x(2);
    valueOfConstraint = x_1^2 + x_2^2;
    if valueOfConstraint < 1
        mu = 0;
    end    
    % Use the computed gradient of function.
    gradF(1) = 2*(x_1 - 1) + 4*mu*x_1*(x_1^2 + x_2^2 - 1);
    gradF(2) = 4*(x_2 - 2) + 4*mu*x_2*(x_1^2 + x_2^2 - 1);
end


