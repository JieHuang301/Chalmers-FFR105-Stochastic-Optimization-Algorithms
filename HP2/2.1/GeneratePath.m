function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

    % Choose a random starting city.
    numberOfCities = length(pheromoneLevel);
    startCity = randi(numberOfCities);
    
    % Create tabu list.
    tabuList = [];
    tabuList = [tabuList startCity];

    % Run iteration.
    for i = 1:numberOfCities-1
        nextCity = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta);
        tabuList = [tabuList nextCity];
    end 
    
    % Get Path.
    path = tabuList(1:numberOfCities);
end