function [environment, length] = genEnvironment2()
    stepSize = 1;
    length = 2500;
    
    function [y] = f1(x)
        if x < 968
            y = 250;
        else 
            y = 0;
        end
    end
    function [y] = f2(x)
        if x < 968 
            y = 150;
        else 
            y = 0;
        end
    end
    function [y] = f3(x)
        if x > 968
            y = 200*sin(x/100) + 300;
        else 
            y = 0;
        end
    end
    function [y] = f4(x)
        if x > 968 
            y = 200*sin(x/100) + 200;
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
    end
    for x2 = 1:100
       environment(1,index) = 0;
       environment(2,index) = 150 + x2;
       index = index + 1;
    end
    %sort x from 0 to 2500
    environment = insertionSort(environment);
    
end

