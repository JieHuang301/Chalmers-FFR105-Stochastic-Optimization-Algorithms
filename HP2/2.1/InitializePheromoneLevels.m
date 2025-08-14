% Initialize pheromone levels with tau_ij = tau0, 0 < i, j <= number of
% cities.

function initialPheromoneLevels = InitializePheromoneLevels(numberOfCities, tau0)

    initialPheromoneLevels = zeros(numberOfCities);
    initialPheromoneLevels(:,:) = tau0;

end