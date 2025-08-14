function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)
     
    numOfAnts = size(pathCollection, 1);
    numOfCities = size(pathCollection, 2);
    deltaPheromoneLevel = zeros(numOfCities);
        
    for k = 1:numOfAnts
        path = [pathCollection(k,:) pathCollection(k,1)];
        for iCity = 1:numOfCities  
            tempValue = deltaPheromoneLevel(path(iCity),path(iCity+1));
            deltaPheromoneLevel(path(iCity),path(iCity+1)) = tempValue + 1/pathLengthCollection(k);
        end
    end  
    
    
end