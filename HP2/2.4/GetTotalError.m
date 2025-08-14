function error = GetTotalError(outputOfChromosome, functionValue)
    numOfPoints = length(outputOfChromosome); 
    error = sqrt(1/numOfPoints * sum((outputOfChromosome-functionValue).^2));
end

