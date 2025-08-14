function velocities = UpdateVelocities(xBestPosition, xGlobalBestPosition, velocities, positions, inertiaWeight, velocityMax)
    detlaT = 1;
    cognitiveComponent = 2;
    socialComponent = 2;
    numOfParticles = size(velocities, 1);
    numOfVariables = size(velocities, 2);
    for i = 1:numOfParticles
        for j = 1:numOfVariables
            q = rand;
            r = rand;            
            temp1 = inertiaWeight * velocities(i,j);
            temp2 = cognitiveComponent* q * (xBestPosition(i,j) - positions(i,j))/detlaT;
            temp3 = socialComponent* r * (xGlobalBestPosition(j) - positions(i,j))/detlaT;
            velocityNew = temp1 + temp2 + temp3;
            velocities(i,j) = min(max(velocityNew, -velocityMax), velocityMax);
        end
    end
end

