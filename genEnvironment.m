function [environment] = genEnvironment(length)
    stepSize = 1;

    function [y] = f1(x)
        if x < 800
            y = 900;
        else 
            y = 0;
        end
    end
    function [y] = f2(x)
        if x < 800 
            y = .5*x + 400;
        else 
            y = 0;
        end
    end
    function [y] = f3(x)
        if x < 880 && x > 185
            y = .5*x + 200;
        else 
            y = 0;
        end
    end
    function [y] = f4(x)
        if x > 880  
            y = 3*x - 2000;
        else 
            y = 0;
        end
    end
    function [y] = f5(x)
            y = 900;
    end    
    function [y] = f6(x)
       y = 200*cos(x/100) + 200;
    end
    function [y] = f7(x)
       if x > 185
       y = 200*cos(x/100) + 350;
       else
       y = 0;
       end
    end
    index = 1;
    for x = 1:stepSize:length
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
    end
 

end

