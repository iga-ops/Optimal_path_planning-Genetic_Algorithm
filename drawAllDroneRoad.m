function drawAllDroneRoad(roads, coordinates, label, figureNumber)
xall = coordinates(:,2); 
yall = coordinates(:,1);


figure(figureNumber)
hold on;
grid on
axis([10 90 10 100])
title('Finish plot')
xlabel('x')
ylabel('y')

for i = 1:length(roads)
    road = roads(i);
    road = road{1, :};
    x = coordinates(road,2); 
    y = coordinates(road,1); 
    plot(x, y, '-', 'MarkerSize', 8, 'LineWidth', 2)
end

%insert map background
I = imread('mapa.jpg'); 
h = image(xlim,ylim,I); 
uistack(h,'bottom')

% points
plot(xall, yall, 'go', 'MarkerSize', 8, 'LineWidth',3, 'Color', 'b')
text(xall+0.3, yall+0.3, label(:), 'FontSize',12, 'fontweight','bold')
