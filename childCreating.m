function child_end = childCreating(population, parent1, parent2, point1, point2)

child = zeros(size(population, 1), 1); % same zera, tyle ile stacji

% copy random portion of genes from the first parent
range1 = randperm(size(population, 1)); % losuje tablice liczb od 1 do sizu populacji 
range1 = sort(range1(1:2)); % sortuje dwie pierwsze wartosci w tablicy 
slice1 = range1(1):range1(2); % tworzy tablice intów z zakresu wyznaczonego przez wyselekcjonowane powyzej wartosci
genes1 = population(slice1, parent1); % z tablicy populacji bierze elementy spod indeksów rodzica i slica
child(slice1) = genes1; %wpisuje otrzymane wartosci pod indeksami slica w dziecku

% copy rest of the genes from the second parent
p2 = population(:, parent2); % bierze cały wiersz? kolumnę? z populacji
genes2 = p2(find(not(ismember(p2, genes1)))); % znajduje punkty które jeszcze nie są w dziecku (te z genes1 są)
slice2 = [1:range1(1)-1, range1(2)+1:size(child, 1)]; % wyznacza pozostale indexy do wpisania wartosci
child(slice2) = genes2; % uzupelnia dziecko

% wycinamy randomowo długi fragment dziecka
size1 = randi([1, size(population, 1)]);
size2 = randi([1, size(population, 1)]);
sorted = sort([size1 size2]);
child_elems = sorted(1):sorted(2);
child = child(child_elems);

% dodawanie punktu poczatkowego i koncowego
child_end = [point1; child; point2];