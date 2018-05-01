function [crashed] = checkCrash(environment,X,Y)
crashed = 0;
tolerance = 2;

if crashed == 0
    crashed = bSearch(environment,X(1),Y(1),tolerance);
end
if crashed == 0
    crashed = bSearch(environment,X(2),Y(2),tolerance);
end
if crashed == 0
    crashed = bSearch(environment,X(3),Y(3),tolerance);
end
if crashed == 0
    crashed = bSearch(environment,X(4),Y(4),tolerance);
end
end

