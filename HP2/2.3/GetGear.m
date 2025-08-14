function newGearNum = GetGear(gearValue, gearNum)
    if gearValue > 0.7
        newGearNum = min(gearNum + 1, 10);
    elseif gearValue < 0.3
        newGearNum = max(gearNum - 1, 1);
    else
        newGearNum = gearNum;
    end
end

