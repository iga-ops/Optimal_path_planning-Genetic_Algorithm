function drawDroneRoad(road, coordinates, label, figureNumber)

colors = getColors();
          
xall = coordinates(:,2); 
yall = coordinates(:,1);

x = coordinates(road,2); 
y = coordinates(road,1); 

figure(figureNumber)
hold on;
plot(xall, yall, 'go', 'MarkerSize', 8, 'LineWidth',3, 'Color', 'b')
plot(x, y, '-go', 'MarkerSize', 8, 'LineWidth',3, 'Color', colors(figureNumber,:))
plot(x(1), y(1), 'm*', 'MarkerSize', 8)
grid on
axis([10 90 10 100])
title('Obtained route for the drone - energy-saving solution')
xlabel('x')
ylabel('y')

%insert map background
I = imread('mapa.jpg'); 
h = image(xlim,ylim,I); 
uistack(h,'bottom')

% point labels
text(xall+0.3, yall+0.3, label(:), 'FontSize',12, 'fontweight','bold')
hold off;
end
