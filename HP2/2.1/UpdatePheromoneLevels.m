function pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel, deltaPheromoneLevel, rho)
    pheromoneLevel = (1 - rho) * pheromoneLevel + deltaPheromoneLevel;
    numberOfCities = size(pheromoneLevel, 1);

    for i = 1:numberOfCities
        for j = 1:numberOfCities
            if pheromoneLevel(i,j) < 1e-15
                pheromoneLevel(i,j) = 1e-15;
            end
        end
    end
end