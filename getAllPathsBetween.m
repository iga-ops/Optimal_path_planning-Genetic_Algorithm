function [paths, distances] = getAllPathsBetween(p1, p2, popSize, it, coordinates, minNodes, weather_conditions)
    len = length(coordinates);
    [s, t] = calculateSandT(len);
    
    [allPaths, A] = getAllPaths(coordinates, s, t, p1, p2, popSize, it, weather_conditions);
    [paths, distances] = getDistancesOfPaths(A, allPaths, minNodes);
end