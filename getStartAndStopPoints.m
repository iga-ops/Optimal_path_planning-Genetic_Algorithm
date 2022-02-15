function [p1, p2] = getStartAndStopPoints(coordinates)
    p1 = 0;
    p2 = 0;
    while p1 == p2
        p = randi(length(coordinates), 1, 2);
        p1 = p(1);
        p2 = p(2);
    end
end