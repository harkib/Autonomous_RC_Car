function [environment, length] = genEnvironment3()
stepSize = 1;
length = 2500;
width = 2500;

% Lines that can be expressed as y = f(x) {c1 < x < c2}
    function [y] = f1(x)
        y = 2500;
    end

    function [y] = f2(x)
        if x < 1250
            y = 2300;
        else
            y = 0;
        end
    end
    function [y] = f3(x)
        if 1250 < x && x < 2400
            y = 2400;
        else
            y = 0;
        end
    end
    function [y] = f4(x)
        if 100 < x && x < 2500
            y = 2200;
        else
            y = 0;
        end
    end
    function [y] = f5(x)
        if 2300 < x && x < 2400
            y = 1450;
        else
            y = 0;
        end
    end
    function [y] = f6(x)
        if 2350 < x
            y = 2300;
        else
            y = 0;
        end
    end
    function [y] = f7(x)
        if x < 2400
            y = 1800;
        else
            y = 0;
        end
    end
    function [y] = f8(x)
        if 1200 < x && x < 2425
            y = 2100;
        else
            y = 0;
        end
    end
    function [y] = f9(x)
        if 1250 < x
            y = 1970;
        else
            y = 0;
        end
    end
    function [y] = f10(x)
        if 1200 < x && x < 2400
            y = 1875;
        else
            y = 0;
        end
    end
    function [y] = f11(x)
        if 100 < x
            y = 200*sin(x/75)+1400;
        else
            y = 0;
        end
    end
    function [y] = f12(x)
        if x < 2400
            y = 200*sin(x/75)+1550;
        else
            y = 0;
        end
    end
    function [y] = f13(x)
        if x < 2400
            y = -200*sin(x/750)+1000;
        else
            y = 0;
        end
    end
    function [y] = f14(x)
        if 100 < x
            y = -200*sin(x/750)+1100;
        else
            y = 0;
        end
    end
    function [y] = f15(x)
        if x < 2400
            y = 200*sin(x/750)+600;
        else
            y = 0;
        end
    end
    function [y] = f16(x)
        if 100 < x
            y = 200*sin(x/750)+520;
        else
            y = 0;
        end
    end
    function [y] = f17(x)
        if 100 < x
            y = 200*sin(x/60)+300;
        else
            y = 0;
        end
    end
    function [y] = f18(x)
        if 100 < x
            y = 200*sin(x/60)+200;
        else
            y = 0;
        end
    end
    function [y] = f19(x)
        if 100 > x
            y = 400;
        else
            y = 0;
        end
    end

index = 1;
for x = 1:stepSize:width
    environment(1,index) = x;
    environment(2,index) = f1(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f2(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f3(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f4(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f5(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f6(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f7(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f8(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f9(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f10(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f11(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f12(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f13(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f14(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f15(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f16(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f17(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f18(x);
    index = index + 1;
    environment(1,index) = x;
    environment(2,index) = f19(x);
    index = index + 1;
end


    % Lines expressed as x = C {c1 < y < c2}
    function [x] = f20(y)
        x = 2500;
    end
    function [x] = f21(y)
        if 2300 < y && y < 2400 
            x = 1250;
        else
            x = 0;
        end
    end
    function [x] = f22(y)
        if 2300 < y && y < 2400 
            x = 1450;
        else
            x = 0;
        end
    end
    function [x] = f23(y)
        if 2300 < y && y < 2400 
            x = 1650;
        else
            x = 0;
        end
    end
    function [x] = f24(y)
        if 2300 < y && y < 2400 
            x = 1850;
        else
            x = 0;
        end
    end
    function [x] = f25(y)
        if 2300 < y && y < 2400 
            x = 2050;
        else
            x = 0;
        end
    end
    function [x] = f26(y)
        if 2300 < y && y < 2400 
            x = 2250;
        else
            x = 0;
        end
    end
    function [x] = f27(y)
        if 2200 < y && y < 2300 
            x = 1350;
        else
            x = 0;
        end
    end

    function [x] = f28(y)
        if 2200 < y && y < 2300 
            x = 1550;
        else
            x = 0;
        end
    end

    function [x] = f29(y)
        if 2200 < y && y < 2300 
            x = 1750;
        else
            x = 0;
        end
    end

    function [x] = f30(y)
        if 2200 < y && y < 2300 
            x = 1950;
        else
            x = 0;
        end
    end
    function [x] = f31(y)
        if 2200 < y && y < 2300 
            x = 2150;
        else
            x = 0;
        end
    end
    function [x] = f32(y)
        if 2200 < y && y < 2300 
            x = 2350;
        else
            x = 0;
        end
    end
    function [x] = f33(y)
        if 1900 < y && y < 2200 
            x = 100;
        else
            x = 0;
        end
    end
    function [x] = f34(y)
        if 1900 < y && y < 2200 
            x = 300;
        else
            x = 0;
        end
    end
    function [x] = f35(y)
        if 1900 < y && y < 2200 
            x = 500;
        else
            x = 0;
        end
    end
    function [x] = f36(y)
        if 1900 < y && y < 2200 
            x = 700;
        else
            x = 0;
        end
    end
    function [x] = f37(y)
        if 1900 < y && y < 2200 
            x = 900;
        else
            x = 0;
        end
    end
    function [x] = f38(y)
        if 1900 < y && y < 2200 
            x = 1100;
        else
            x = 0;
        end
    end
    function [x] = f39(y)
        if 1800 < y && y < 2100 
            x = 200;
        else
            x = 0;
        end
    end
    function [x] = f40(y)
        if 1800 < y && y < 2100 
            x = 400;
        else
            x = 0;
        end
    end
    function [x] = f41(y)
        if 1800 < y && y < 2100 
            x = 600;
        else
            x = 0;
        end
    end
    function [x] = f42(y)
        if 1800 < y && y < 2100 
            x = 800;
        else
            x = 0;
        end
    end
    function [x] = f43(y)
        if 1800 < y && y < 2100 
            x = 1000;
        else
            x = 0;
        end
    end
    function [x] = f44(y)
        if 1800 < y && y < 2100 
            x = 1200;
        else
            x = 0;
        end
    end
    function [x] = f45(y)
        if 1660 < y && y < 1875 
            x = 2400;
        else
            x = 0;
        end
    end
    function [x] = f46(y)
        if 1073 < y && y < 1593 
            x = 100;
        else
            x = 0;
        end
    end
    function [x] = f47(y)
        if 590 < y && y < 1011 
            x = 2400;
        else
            x = 0;
        end
    end
    function [x] = f48(y)
        if 500 < y && y < 545 
            x = 100;
        else
            x = 0;
        end
    end

for y = 1:stepSize:length
    environment(2,index) = y;
    environment(1,index) = f20(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f21(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f22(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f23(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f24(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f25(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f26(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f27(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f28(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f29(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f30(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f31(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f32(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f33(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f34(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f35(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f36(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f37(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f38(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f39(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f40(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f41(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f42(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f43(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f44(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f45(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f46(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f47(y);
    index = index + 1;
    environment(2,index) = y;
    environment(1,index) = f48(y);
    index = index + 1;   
end
%sort x from 0 to 2500
environment = insertionSort(environment);

end

