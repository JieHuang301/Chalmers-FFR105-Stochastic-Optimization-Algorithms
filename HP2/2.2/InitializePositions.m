function initialPositions = InitializePositions(range, numOfVariables, numOfParticles)
    xMax = range(end);
    xMin = range(1);
    initialPositions = zeros(numOfParticles,numOfVariables);
    for i = 1:numOfParticles
        for j = 1:numOfVariables
        initialPositions(i,j) = xMin + rand * (xMax - xMin);
        end
    end
end

