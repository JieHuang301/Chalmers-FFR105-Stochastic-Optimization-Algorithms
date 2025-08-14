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

% Parameter can be changed.
detlaTime = 0.01;
numOfHidden = 5;
populationSize = 100;

mutationProbability = 0.02;
crossoverProbability = 0.4;
tournamentProbability = 0.6;
tournamentSize = 5;
numOfGenerations = 200;

% Test
iDataSet = 3;
iSlope = 3;
bestChromosome = BestChromosome;

% Initialization
velocity = velocityStart;
temp = tempStart;
gearNum = gearStart;
time = 0;
xPosition = 0;
notStop = true; 

velocityList = velocityStart;
gearList = gearStart;
alphaList = 0;
tempList = tempStart;
perdalsPressureList = 0;

draw = true;

while notStop
    time = time + 1;  
    % Get parameters.
    alpha = GetSlopeAngle(xPosition, iSlope, iDataSet);
    inputV = velocity/velocityMax;
    inputAlpha = alpha/alphaMax;
    inputTemp = temp/tempMax;
    input = [inputV; inputAlpha; inputTemp];
    
    alphaList = [alphaList alpha];
    % Decode the chromosome.
    [weightIH, weightHO] = DecodeChromosome(bestChromosome, numOfInput, numOfHidden, numOfOutput, weightMax);
    % Run the FFNN.
    output = RunFFNN(weightIH, weightHO, input, constantOfActivationFunction);

    % Get the parameter of truck.
    perdalsPressure = output(1);
    perdalsPressureList = [perdalsPressureList perdalsPressure];

    gearValue = output(2);        
    gearNumNew = GetGear(gearValue, gearNum);
    % Renew the gear in 2 seconds.
    if mod(time*detlaTime, 2) == 0
       gearNum = gearNumNew;
    end  
    gearList = [gearList gearNumNew];

    % Run the truck.
    [velocity, temp] = RunTruck(velocity, detlaTime, temp, alpha, perdalsPressure, gearNum);
    xPosition = xPosition + velocity * detlaTime;
    % Set stop condition.

    if xPosition >= DISTANCE || velocity >= velocityMax || velocity <= velocityMin ||temp >= tempMax
        notStop = false;
    end    
    velocityList = [velocityList velocity];
    tempList = [tempList temp];
end  

fitnessValue =  sum(velocityList)/length(velocityList) * xPosition;

if draw
    subplot(5, 1, 1);
    x = 1:length(alphaList);
    plot(x,alphaList);
    title('Alpha');
    
    subplot(5, 1, 2);
    y = 1:length(perdalsPressureList);
    plot(y,perdalsPressureList);
    title('Pressure of perdals')
    
    subplot(5, 1, 3);
    z = 1:length(gearList);
    plot(z,gearList);
    title('Gear');
    
    subplot(5, 1, 4);
    k = 1:length(velocityList);
    plot(k,velocityList);
    title('V');
    
    subplot(5, 1, 5);
    l = 1:length(tempList);
    plot(l,tempList);
    title('Temperature');
    xlabel('Time Step = 0.01')
end
