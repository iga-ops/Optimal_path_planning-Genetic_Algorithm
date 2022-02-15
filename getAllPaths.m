function [allpaths, A] = getAllPaths(coordinates, s, t, p1, p2, popSize, it, conditions)
    len = length(coordinates);
    d = sqrt(sum((coordinates(s,:)-coordinates(t,:)).^2,2));
    s_len = length(s);
    
    %apply conditions to cost of travel
    real_cost = d.*conditions;
    
    A = sparse(s, t, real_cost, len, len);
    A = A+A';
    
    allpaths = geneticAlgotithm(coordinates, p1, p2, popSize, it);
end
