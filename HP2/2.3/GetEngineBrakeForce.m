function fEngineBrake = GetEngineBrakeForce(gearNum)
    cB  = 3000;
    switch gearNum
        case 1
            fEngineBrake = 7.0 * cB;
        case 2
            fEngineBrake = 5.0 * cB;
        case 3
            fEngineBrake = 4.0 * cB;
        case 4
            fEngineBrake = 3.0 * cB;
        case 5
            fEngineBrake = 2.5 * cB;
        case 6
            fEngineBrake = 2.0 * cB;
        case 7
            fEngineBrake = 1.6 * cB;
        case 8
            fEngineBrake = 1.4 * cB;
        case 9
            fEngineBrake = 1.2 * cB;
        case 10
            fEngineBrake = cB;
    end
end

