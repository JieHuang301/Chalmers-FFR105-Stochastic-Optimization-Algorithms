function [vNew, brakeTemp] = RunTruck(v, detlaT, brakeTemp, alpha, perdalsPressure, gearNum)
    m = 20000;
    g = 9.8;
    maxTemp = 750;
    ambientTemp = 283;
    tau = 30;
    cH = 40;
    
    detlaTemp = brakeTemp - ambientTemp;
    if perdalsPressure < 0.01
        dDetlaTemp = - detlaTemp/tau;
    else
        dDetlaTemp = cH * perdalsPressure;
    end
    detlaTemp = detlaTemp + dDetlaTemp * detlaT;
    brakeTemp = ambientTemp + detlaTemp;

    % Get the force from foundation brake.
    if brakeTemp < maxTemp - 100
        fFoundationBrakes = m*g*perdalsPressure/20;
    else
        fFoundationBrakes = (m*g*perdalsPressure*exp(-(brakeTemp-(maxTemp-100))/100))/20;
    end
    
    % Get the force from engine brake.
    fEngineBrake = GetEngineBrakeForce(gearNum);    
    acceleration = g * sind(alpha) - fFoundationBrakes/m - fEngineBrake/m;    
    vNew = acceleration * detlaT + v;  
end

