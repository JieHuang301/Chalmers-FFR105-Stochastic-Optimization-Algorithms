function [xBestPosition, xBestPerformance] = UpdateBestPositions(xBestPosition, xBestPerformance, positions, performance)
    numOfParticles = length(performance);
    for i = 1:numOfParticles
        if xBestPerformance(i) > performance(i)
            xBestPerformance(i) = performance(i);
            xBestPosition(i,:) = positions(i,:);
        end
    end
end

