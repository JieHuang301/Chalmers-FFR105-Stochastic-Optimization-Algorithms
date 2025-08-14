function fitnessValue = EvaluateChromosome(chromosome, detlaTime, numOfHidden, iDataSet, iSlope)
    % Parameter cannot be changed.
    DISTANCE = 1000;
    tempMax = 750;
    velocityMax = 25;
    velocityMin = 1;
    alphaMax = 10;
    velocityStart = 20;
    gearStart = 7;
    tempStart = 500;
    weightMax = 5;
    constantOfActivationFunction = 1;
    numOfInput = 3;
    numOfOutput = 2;
    
    % Initialization
    velocity = velocityStart;
    temp = tempStart;
    gearNum = gearStart;
    time = 0;
    xPosition = 0;
    notStop = true;   
    velocityList = velocityStart;

    while notStop
        time = time + 1;  
        % Get parameters.
        alpha = GetSlopeAngle(xPosition, iSlope, iDataSet);
        inputV = velocity/velocityMax;
        inputAlpha = alpha/alphaMax;
        inputTemp = temp/tempMax;
        input = [inputV; inputAlpha; inputTemp];

        % Decode the chromosome.
        [weightIH, weightHO] = DecodeChromosome(chromosome, numOfInput, numOfHidden, numOfOutput, weightMax);
        % Run the FFNN.
        output = RunFFNN(weightIH, weightHO, input, constantOfActivationFunction);
    
        % Get the parameter of truck.
        perdalsPressure = output(1);
        gearValue = output(2);        
        gearNumNew = GetGear(gearValue, gearNum);
               
        % Renew the gear in 2 seconds.
        if mod(time*detlaTime, 2) == 0
           gearNum = gearNumNew;
        end  
        
        % Run the truck.
        [velocity, temp] = RunTruck(velocity, detlaTime, temp, alpha, perdalsPressure, gearNum);
        xPosition = xPosition + velocity * detlaTime;
        % Set stop condition.
        if xPosition >= DISTANCE || velocity >= velocityMax || velocity <= velocityMin ||temp >= tempMax
            notStop = false;
        end    
        velocityList = [velocityList velocity];
    end    
    fitnessValue =  sum(velocityList)/length(velocityList) * xPosition;

end

