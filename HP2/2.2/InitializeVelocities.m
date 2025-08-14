function initialVelocities = InitializeVelocities(range, numOfVariables, numOfParticles)
    alpha = 1;
    deltaT = 1;
    xMax = range(end);
    xMin = range(1);
    initialVelocities = zeros(numOfParticles,numOfVariables);
    for i = 1:numOfParticles
        for j = 1:numOfVariables
        initialVelocities(i,j) = alpha * (xMin + rand * (xMax - xMin))/deltaT;
        end
    end
end

