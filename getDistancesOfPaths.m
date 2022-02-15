
function [paths_sorted, dist_sorted] = getDistancesOfPaths(A, allp, minNodes)
distances = [];
paths = {};

np = length(allp);

for k=1:np
    pk = allp{k};
    if length(pk) > minNodes
        i = sub2ind(size(A),pk(1:end-1),pk(2:end));
        d = full(sum(A(i)));
        distances(end+1) = d;
        paths{end+1} = pk;
    end
end
[dist_sorted,I] = sort(distances);
paths_sorted = paths(I);
end