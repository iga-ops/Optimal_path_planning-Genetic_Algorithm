function M = PathsCell2Array(finishPaths)
%function returns the numeric array of all paths passed found with "finishPaths"
%if one path is longer than others it fills end of the rest with zeros
    max_path_len = 0;
    for i=1:length(finishPaths)
        path_len = length(finishPaths{i});
        if path_len>max_path_len
            max_path_len = path_len;
        end
    end
    
    %drones_population = length(finishPaths);
    drones_population = length(finishPaths);
    M = zeros(drones_population, max_path_len);

    for drone = 1:drones_population
        nodes =  (finishPaths{drone})'; 
        size = length(nodes);
        M( drone,1 : size) = nodes;
    end
end