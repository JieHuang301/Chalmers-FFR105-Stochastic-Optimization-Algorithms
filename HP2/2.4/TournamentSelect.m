function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    populationSize = length(fitnessList);
    iTmp = randi(populationSize, [1, tournamentSize]); % iTmp contains indexes of the fitnessList

    % Do the tournament
    for i = 1:tournamentSize
        % For the last one, break 
        if i == tournamentSize
            selectedIndividualIndex = iTmp;
            break;
        end
        r = rand;
        start = iTmp(1); % Initialize
        fitnessOfBest = fitnessList(start); 
        indexOfBestTmp = 1;
        % Find the best one
        for j = 1:tournamentSize-i+1
            indexOfTmp = iTmp(j);
            if fitnessList(indexOfTmp) > fitnessOfBest
                indexOfBestTmp = j;
                fitnessOfBest = fitnessList(indexOfTmp);            
            end
        end
        
        if r < tournamentProbability 
            selectedIndividualIndex = iTmp(indexOfBestTmp);
            break;
        else
            iTmp(indexOfBestTmp) = [];    % Detect the best which is not selected from index
        end        
    end
    
end

