%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02) ...
pMutList = zeros(1,10);

mutationProbability = 0.0;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList00 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList00(i,1) = maximumFitness;
end
pMutList(1) = 0.0;

mutationProbability = 0.005;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList0005 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList0005(i,1) = maximumFitness;
end
pMutList(2) = 0.005;

mutationProbability = 0.01;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList001 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList001(i,1) = maximumFitness;
end
pMutList(3) = 0.01;

mutationProbability = 0.02;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList002 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList002(i,1) = maximumFitness;
end
pMutList(4) = 0.02;


% ... and here (pMut > 0.02)
mutationProbability = 0.03;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList003 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList003(i,1) = maximumFitness;
end
pMutList(5) = 0.03;

mutationProbability = 0.05;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList005 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList005(i,1) = maximumFitness;
end
pMutList(6) = 0.05;

mutationProbability = 0.1;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList01 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList01(i,1) = maximumFitness;
end
pMutList(7) = 0.1;

mutationProbability = 0.2;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList02 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList02(i,1) = maximumFitness;
end
pMutList(8) = 0.2;

mutationProbability = 0.25;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList025 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList025(i,1) = maximumFitness;
end
pMutList(9) = 0.25;

mutationProbability = 0.5;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList05 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList05(i,1) = maximumFitness;
end
pMutList(10) = 0.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02) ...
listMedian = zeros(1,10);

average00 = mean(maximumFitnessList00);
median00 = median(maximumFitnessList00);
std00 = sqrt(var(maximumFitnessList00));
sprintf('PMut = 0.0: Median: %0.10f, Average: %0.10f, STD: %0.10f', median00, average00, std00)
listMedian(1) = median00;

average0005 = mean(maximumFitnessList0005);
median0005 = median(maximumFitnessList0005);
std0005 = sqrt(var(maximumFitnessList0005));
sprintf('PMut = 0.005: Median: %0.10f, Average: %0.10f, STD: %0.10f', median0005, average0005, std0005)
listMedian(2) = median0005;

average001 = mean(maximumFitnessList001);
median001 = median(maximumFitnessList001);
std001 = sqrt(var(maximumFitnessList001));
sprintf('PMut = 0.01: Median: %0.10f, Average: %0.10f, STD: %0.10f', median001, average001, std001)
listMedian(3) = median001;

average002 = mean(maximumFitnessList002);
median002 = median(maximumFitnessList002);
std002 = sqrt(var(maximumFitnessList002));
sprintf('PMut = 0.02: Median: %0.10f, Average: %0.10f, STD: %0.10f', median002, average002, std002)
listMedian(4) = median002;

% ... and here (pMut > 0.02)
average003 = mean(maximumFitnessList003);
median003 = median(maximumFitnessList003);
std003 = sqrt(var(maximumFitnessList003));
sprintf('PMut = 0.03: Median: %0.10f, Average: %0.10f, STD: %0.10f', median003, average003, std003)
listMedian(5) = median003;

average005 = mean(maximumFitnessList005);
median005 = median(maximumFitnessList005);
std005 = sqrt(var(maximumFitnessList005));
sprintf('PMut = 0.05: Median: %0.10f, Average: %0.10f, STD: %0.10f', median005, average005, std005)
listMedian(6) = median005;

average01 = mean(maximumFitnessList01);
median01 = median(maximumFitnessList01);
std01 = sqrt(var(maximumFitnessList01));
sprintf('PMut = 0.1: Median: %0.10f, Average: %0.10f, STD: %0.10f', median01, average01, std01)
listMedian(7) = median01;

average02 = mean(maximumFitnessList02);
median02 = median(maximumFitnessList02);
std02 = sqrt(var(maximumFitnessList02));
sprintf('PMut = 0.2: Median: %0.10f, Average: %0.10f, STD: %0.10f', median02, average02, std02)
listMedian(8) = median02;

average025 = mean(maximumFitnessList025);
median025 = median(maximumFitnessList025);
std025 = sqrt(var(maximumFitnessList025));
sprintf('PMut = 0.25: Median: %0.10f, Average: %0.10f, STD: %0.10f', median025, average025, std025)
listMedian(9) = median025;

average05 = mean(maximumFitnessList05);
median05 = median(maximumFitnessList05);
std05 = sqrt(var(maximumFitnessList05));
sprintf('PMut = 0.5: Median: %0.10f, Average: %0.10f, STD: %0.10f', median05, average05, std05)
listMedian(10) = median05;

% Plot
% figure('Position', [100, 100, 1000, 500]); 
% plot(pMutList,listMedian,'-o','LineWidth',1,'MarkerEdgeColor','k');
% grid on;
% xlabel('p_{mut}');
% ylabel('Median Performances');
