%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PSO for location of local minima 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

% Parameters
numOfVariables = 2;
numOfParticles = 200;
range = [-5, 5];
iterations = 20;

for i = 1:iterations
    % Initialization
    inertiaWeight = 1.4;
    positions = InitializePositions(range, numOfVariables, numOfParticles);
    velocities = InitializeVelocities(range, numOfVariables, numOfParticles);
    xBestPosition = zeros(numOfParticles, numOfVariables);
    xBestPerformance = Inf(numOfParticles, 1);
    xGlobalBestPosition = zeros(1, numOfVariables); 
    xGlobalBestPerformance = inf;
    velocityMax = range(end);
        
    while inertiaWeight > 0.4
        % Evaluate
        performance = zeros(numOfParticles, 1);
        for i = 1:numOfParticles
            x1 = positions(i, 1);
            x2 = positions(i, 2);
            performance(i) = GetFunctionValue(x1, x2);
        end
        
        % Update the best position and the global best position.
        [xBestPosition, xBestPerformance] =  UpdateBestPositions(xBestPosition, xBestPerformance, positions, performance);
        [xGlobalBestPosition, xGlobalBestPerformance] = UpdateGlobalBestPosition(xGlobalBestPosition, xGlobalBestPerformance, positions, performance);
        
        % Update particle velocities and positions.
        velocities = UpdateVelocities(xBestPosition, xGlobalBestPosition, velocities, positions, inertiaWeight, velocityMax);
        positions = UpdatePositions(positions, velocities);
        
        % Reduce inertia weight.
        inertiaWeight = inertiaWeight * 0.99;
    end
    
    fprintf('One local minima is at (%.5f,%.5f). Function value is %.5f. \n',xGlobalBestPosition(1), xGlobalBestPosition(end), xGlobalBestPerformance);
end



