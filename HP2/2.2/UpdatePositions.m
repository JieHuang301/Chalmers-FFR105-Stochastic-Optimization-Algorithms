function positions = UpdatePositions(positions, velocities)
    detlaT = 1;
    positions = positions + velocities * detlaT;
end

