function all_points = geneticAlgotithm(coordinates, p1, p2, popsize, it)

stat_numb = size(coordinates, 1);

% population init
population = zeros(stat_numb-2, popsize);
distances = zeros(popsize, 1);

for pop = 1:popsize
    temp_road = randperm(stat_numb)';
    road = zeros(length(temp_road)-2, 1);
    idx = 1;
    for ran = 1:length(temp_road)
        el = temp_road(ran);
        if el ~= p1 && el ~= p2 
            road(idx) = el;
            idx = idx + 1;
        end
    end
    
    population(:, pop) = road;
    
    x = coordinates(road, 2); 
    y = coordinates(road, 1); 

    dx = circshift(x, -1) - x;
    dy = circshift(y, -1) - y;

    d = sum(sqrt(dx .* dx + dy .* dy));
    distances(pop) = d;
end
[distances, idx] = sort(distances);
population = population(:, idx);

all_points = cell(it, 1);

% serching best solutions in the range of it
for iter=1:it
    parents = Selection(distances, 2);
	child = childCreating(population, parents(1), parents(2), p1, p2);
    
    all_points{iter} = child;
end