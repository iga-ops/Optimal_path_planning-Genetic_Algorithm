function [s, t] = calculateSandT(len)
    s = [];
    t = [];
    for i = 1:len
        x = zeros(1, len-1);
        y = zeros(1, len-1);
        cnt = 1;
        for j = 1:len
            if j ~= i
                y(cnt)= i;
                x(cnt)= j;
                cnt = cnt + 1;

            end
        end
       s = cat(2,s,x);
       t = cat(2,t,y);
    end
end