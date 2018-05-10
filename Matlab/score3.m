function [score] = score3(x,y)
%Takes final postion and returns score for environment 3
if y > 2300 && x < 1250
    score = x;
elseif y > 2400
    score = x;
elseif y > 2200
    score = 5000 - x;
elseif y > 1800 && x < 1200
    score = 5000 + 5*x;
elseif y > 2100
    score = 11000 - 1200 + x;
elseif y > 1970
    score = 12200 + 2500 - x;
elseif y > 1875
    score = 13600 - 1200 + x;
elseif y > 1200
    score = 14900 + 2500 - x;
elseif y > 800
    score = 17400 + x;
elseif y > 481
    score = 19900 + 2500 - x;
else
    score = 22400 + x;
end
end

