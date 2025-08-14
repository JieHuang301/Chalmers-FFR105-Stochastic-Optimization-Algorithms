% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue);
    numberOfGenes = size(chromosome,2);
    nBitsInOneGene = numberOfGenes/numberOfVariables; % Compute k
    
    for i = 1:numberOfVariables
        x(i) = 0.0;
        for j = 1:nBitsInOneGene
            x(i) = x(i) + chromosome((i - 1)*nBitsInOneGene + j)*2^(-j);
        end
        x(i) = -maximumVariableValue + 2*maximumVariableValue*x(i)/(1 - 2^(-nBitsInOneGene));
    end

end
