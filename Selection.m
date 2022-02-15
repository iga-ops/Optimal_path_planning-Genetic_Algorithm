%We select the individuals who will be more likely to be parents in the
%next iteration, based on Roulette wheel selection Reproduction Operator.

function sel = Selection(distances, N)

s = size(distances, 1);
max_dist = max(distances);

w = 1 - distances ./ max_dist;
b = round(w * s);
counted = s + sum(b);
temp = zeros(counted, 1);
temp(1:s) = 1:s;
m = s + 1;

for i = 1:size(b, 1)
	bonus = b(i);
	temp(m : m - 1 + bonus) = i;
	m = m + bonus;
end

temp = temp(randperm(size(temp, 1)));
[C ia] = unique(temp, 'first');
temp = temp(sort(ia));

sel = temp(1:N);

%In our case, elements for whom the distance value is smaller, 
%have greater probability, to be chosen as parents.