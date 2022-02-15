clear all; close all; clc;

autoRun_text = sprintf('Do you want to run the app in the auto mode? 1/0: ');
autoRun = input(autoRun_text);

manyPlots_text = sprintf('Do you want to generate a separate plot for each drone? 1/0: ');
manyPlots = input(manyPlots_text);

[coordinates, labels, chargingPlaces] = getStations();
if autoRun
    fprintf('\nRunning auto mode...\n\n');
    
    minNodesBetween = 2;
    minNodesBetween = minNodesBetween + 1;
    dronNumbers = 6;
    
    % genetic alghorithm config
    populationSize = 50;
    iterations = 10000;
else 
    fprintf('\nTo exit console , ress Ctrl+C\n\n');
    minNodes_text = sprintf('Specify minimal number of nodes between (recomended 2): ');
    minNodesBetween = input(minNodes_text);
    minNodesBetween = minNodesBetween + 1;
    dronNumbers_text = sprintf('Specify number of drones (max 10): ');
    dronNumbers = input(dronNumbers_text);
    popSize_text = sprintf('Specify population size (genetic algorithm config, recomended 50): ');
    populationSize = input(popSize_text);
    it_text = sprintf('Specify number of iteration (genetic algorithm config, recomended 10000): ');
    iterations = input(it_text);
    
    customWhether_text = sprintf('Do you want to specify whether conditions? 1/0: ');
    customWhether = input(customWhether_text);

end

places = createBusyList(chargingPlaces);
finishPaths = cell(dronNumbers, 1);
finishEnergy = zeros(dronNumbers, 1);

for i = 1:dronNumbers
    fprintf('\nFinding path for drone number %d...\n', i);
    if autoRun
        [p1, p2] = getStartAndStopPoints(coordinates);
    else 
        p1_text = sprintf('Specify start point for drone %d (from 1 to %d): ', i, length(coordinates));
        p1 = input(p1_text);
        p2_text = sprintf('Specify end point for drone %d (from 1 to %d): ', i, length(coordinates));
        p2 = input(p2_text);
    end
    
    % generate random wheather conditions
    if autoRun || ~customWhether
        weatherConditions = abs(normrnd(0.5,0.3));
    else 
        weatherConditions_text = sprintf('Specify weater conditions for drone %d (from 0.1 to 0.9): ', i);
        weatherConditions = input(weatherConditions_text);
    end
    
    [paths, energies] = getAllPathsBetween(p1, p2, populationSize, iterations, coordinates, minNodesBetween, weatherConditions);
    [bestPath, bestDistance] = getBestPossiblePath(paths, energies, places);  
    places = takePlacesInStations(places, bestPath); 
    
    finishPaths{i} = bestPath;
    finishEnergy(i) = bestDistance;
    
    if manyPlots
        drawDroneRoad(bestPath, coordinates, labels, i);
    end
end
fprintf('\n\nFinding finished, check results:');
celldisp(finishPaths)

energiesSum = sum(finishEnergy);
fprintf('Sum of energy = %8.f \n\n', energiesSum);

if ~manyPlots
    drawSynchronousAllDronesRoad(finishPaths, coordinates, labels)
end