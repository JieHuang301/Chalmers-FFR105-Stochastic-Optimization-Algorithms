function pathLength = GetPathLength(path, cityLocation)
    
    totalPath = [path path(1)]; % Add the last path.
    numOfCities = length(path);
    pathLength = 0;
    numOfCoordinate = size(cityLocation, 2); 

    % Although in this case the dimension is 2, this part can deal 
    % with points in high dimensions.
    for iCity = 1:numOfCities
        cityNow = totalPath(iCity);
        cityNext = totalPath(iCity + 1);
        squareSum = 0; 
        for iCoordinate = 1:numOfCoordinate
            squareSum = squareSum + (cityLocation(cityNext, iCoordinate)-cityLocation(cityNow, iCoordinate))^2;
        end
        pathLength = pathLength + sqrt(squareSum);
    end

end