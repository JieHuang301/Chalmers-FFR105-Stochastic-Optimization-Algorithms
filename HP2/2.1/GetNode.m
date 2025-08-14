function nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta)
    
    numOfNodes = length(pheromoneLevel);
    numOfVisitedNodes = length(tabuList);
    numOfUnvisitedNodes = numOfNodes - numOfVisitedNodes;
    
    % Get the list of unvisited nodes.
    listOfUnvistedNodes = 1:50;
    listOfUnvistedNodes(tabuList) = [];
    nodeNow = tabuList(end);

    probabilityOfNodes = zeros(1, numOfNodes); % For visited nodes, P = 0.
    
    % Calculate the denominator of probability for normalization.
    denominatorOfProbability = 0;
    for iUnvisitedNodes = 1:numOfUnvisitedNodes
        tau = pheromoneLevel(listOfUnvistedNodes(iUnvisitedNodes), nodeNow);
        eta = visibility(listOfUnvistedNodes(iUnvisitedNodes), nodeNow);
        denominatorOfProbability = denominatorOfProbability + (tau^alpha) * (eta^beta);
    end

    % Calculate the probability.
    for jUnvisitedNodes = 1:numOfUnvisitedNodes
        tau = pheromoneLevel(listOfUnvistedNodes(jUnvisitedNodes), nodeNow);
        eta = visibility(listOfUnvistedNodes(jUnvisitedNodes), nodeNow); 
        numeratorOfProbability = (tau^alpha) * (eta^beta);
        probabilityOfNodes(listOfUnvistedNodes(jUnvisitedNodes)) = numeratorOfProbability/denominatorOfProbability;
    end

    % Roulette-wheel Selection
    numRandom = rand;
    fitnessValue = 0;
    for iNodes = 1:numOfNodes
        fitnessValue = fitnessValue + probabilityOfNodes(iNodes);  
        if numRandom < fitnessValue
            nextNode = iNodes;
            break; 
        end       
    end
    
end