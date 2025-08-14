% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)
    x = xStart;
    stop = false;    
    while ~stop
        xOld = x;
        gradient = ComputeGradient(x,mu);
        x = x - eta*gradient;
        detlaGradient = ComputeGradient(x,mu) - ComputeGradient(xOld,mu);
        normOfDetlaGradient = sqrt(detlaGradient(1)^2 + detlaGradient(2)^2); % Calculate the L2 norm.
        if normOfDetlaGradient < gradientTolerance 
            stop = true;
        end
    end    
end

