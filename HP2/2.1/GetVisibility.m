% Calculate the eta_ij = 1/d_ij, d_ij = sqrt((x_i-x_j)^2+(y_i-y_j)^2).

function visibility = GetVisibility(cityLocation)
    numberOfCities = length(cityLocation);
    numOfCoordinate = size(cityLocation, 2);
    visibility = zeros(numberOfCities);
    for iCity = 1:numberOfCities
        for jCity = 1:numberOfCities

            % Although in this case the dimension is 2, this part can deal 
            % with points in high dimensions.        
            squareSum = 0;            
            for iCoordinate = 1:numOfCoordinate
                squareSum = squareSum + (cityLocation(iCity, iCoordinate)-cityLocation(jCity, iCoordinate))^2;
            end
            visibility(iCity, jCity) = 1/sqrt(squareSum);

        end
    end
end