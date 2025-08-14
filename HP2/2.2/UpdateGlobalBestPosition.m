function [xGlobalBestPosition, xGlobalBestPerformance] = UpdateGlobalBestPosition(xGlobalBestPosition, xGlobalBestPerformance, positions, performance)
    numOfParticles = length(performance);
    for i = 1:numOfParticles
        if xGlobalBestPerformance > performance(i)
            xGlobalBestPerformance = performance(i);
            xGlobalBestPosition = positions(i,:);
        end
    end
end

