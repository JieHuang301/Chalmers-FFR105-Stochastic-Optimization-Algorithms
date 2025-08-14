% nIn = the number of inputs
% nHidden = the number of hidden neurons
% nOut = the number of output neurons
% Weights (and biases) should take values in the range [-wMax,wMax]

function [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax);
    wIH = zeros(nHidden, nIn+1);
    wHO = zeros(nOut, nHidden+1);
    
    chromosome = -wMax+2.*chromosome.*wMax;
    for i = 1:nHidden
        for j = 1:nIn+1 
            wIH(i,j) = chromosome((nIn+1)*(i-1)+j);
        end
    end
    
    for i = 1:nOut
        for j = 1:nHidden+1 
            wHO(i,j) = chromosome((nIn+1)*nHidden+(nHidden+1)*(i-1)+j);
        end
    end
        
end
