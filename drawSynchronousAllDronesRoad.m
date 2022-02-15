function drawSynchronousAllDronesRoad(finishPaths, coordinates, labels)
    colors = getColors();
    
    xall = coordinates(:,2); 
    yall = coordinates(:,1);
    
    %generate array of paths
    M = PathsCell2Array(finishPaths);

    drones_population = length(finishPaths);
    max_path_len = length(M(1,:));

    %matrices of progress of every drone
    progresses_x = zeros(drones_population,max_path_len);
    progresses_y = zeros(drones_population,max_path_len);

    step = 0;
    figure(drones_population+1)
    
    plot(xall, yall, 'go', 'MarkerSize', 8, 'LineWidth',3, 'Color', 'b')
    grid on
    axis([10 120 10 100])
    title('Obtained route for the drone - energy-saving solution')
    xlabel('x')
    ylabel('y')
    hold on;
    legendInfo{1}=('Stations');
    legend(legendInfo);
    
    %insert map background
    I = imread('mapa.jpg'); 
    h = image(xlim,ylim,I); 
    uistack(h,'bottom')
    text(xall+0.3, yall+0.3, labels(:), 'FontSize',12, 'fontweight','bold')
    %iterate through steps
    
    while max_path_len > step
        pause(1);
        step = step+1;
     
        for drone = 1:drones_population
            path = M(drone,:);
            L = path ~= 0;
            new_path = path(L);
            x = coordinates(new_path,2); 
            y = coordinates(new_path,1);

            if step<=length(x)
                progresses_x(drone,step) = x(step);
                progresses_y(drone,step) = y(step);
            end

            I = find(progresses_x(drone,:));
            x_to_disp = progresses_x(drone,I);
            y_to_disp = progresses_y(drone,I);

            plot(x_to_disp, y_to_disp, '-go', 'MarkerSize', 5, 'LineWidth',2,'Color',colors(drone,:));
            legendInfo{drone+1}=(['Drone ' num2str(drone)]);
            legend(legendInfo);
        end
    end 
    
end
