function population = InitializePopulation(populationSize, nIn, nHidden, nOut);
    wMax = 5;
    numberOfGenes = (nIn+1)*nHidden + (nHidden+1)*nOut;
    population = zeros(populationSize, numberOfGenes);
    for i = 1:populationSize
        weightIH = randi([-wMax wMax],  nHidden, nIn);
        thresholdIH = zeros(nHidden, 1);
        weightHO = randi([-wMax wMax], nOut, nHidden);
        thresholdHO = zeros(nOut, 1); 
        wIH = [weightIH thresholdIH];
        wHO = [weightHO thresholdHO];
        population(i,:) = EncodeNetwork(wIH, wHO, wMax);
    end
end
