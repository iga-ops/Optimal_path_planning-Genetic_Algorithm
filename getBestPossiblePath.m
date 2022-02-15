function [bestPath, bestDistance] = getBestPossiblePath(paths, distances, places)
    isBestPath = 0;
    idx = 1;
    pathsLen = length(paths);

    while ~isBestPath      
        if idx > pathsLen
            error('Error. Cannot find possible path')
        end
        bestPath = paths(idx);
        bestDistance = distances(idx);
        bestPath = bestPath{1, :};
        
        % check places in stations in every step
        isPlaceInStation = 1;
        for i=1:length(bestPath)
            el = bestPath(i);
            if places(el, i) < 1
                isPlaceInStation = 0;
            end
        end
        
        if isPlaceInStation
            isBestPath = 1;
        end
        
        idx = idx + 1;
    end
end