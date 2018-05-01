%%Creates Intial Generation
clear;
clc;

%% Constants and intial conditions
% Input/output units are in cm and cm/s
[environment,envLength] = genEnvironment2();
[carWidth, carLength, stepSize] = constants();
% Car is repersent by a direction (theta) and it center postion (x,y) theta
% = 0 is parallel with potive x-asix
% sensors can read a max of 100 cm S1 is striaght, S2 and S3 are at corners
% facing out at 30 degrees from origin, S4 and S5 are at side facing out. Specified in
% getSenorData()

batchSize = 36; %should be perfect square

for g = 1:batchSize
    clc;
    disp(['simulating net ', num2str(g) , ' of ', num2str(batchSize)]);
    
    %Car intial Conditions
    theta = 0;
    x = 50;
    y = 200;
    
    %Create network. 7 input (5 sensors, current speed, current steering
    %angle). 2 outputs (speed and steering angle). 1 intermiadite layer with 7
    %nodes. Outputs are repersented as regular layers -> 2 layers
    biasConnect = [0;0];
    inputConnect = [1 1 1 1 1 1 1;0 0 0 0 0 0 0];
    layerConnect = [0 0; 1 0];
    outputConnect = [0 1];
    net = network(7,2,biasConnect,inputConnect,layerConnect, outputConnect);
    net.layers{1}.size = 7;
    net.layers{2}.size = 2;
    net.inputs{1}.range = [0 100];
    net.inputs{2}.range = [0 100];
    net.inputs{3}.range = [0 100];
    net.inputs{4}.range = [0 100];
    net.inputs{5}.range = [0 100];
    net.inputs{6}.range = [0 300];
    net.inputs{7}.range = [-45 45];
    net.layers{1}.transferFcn = 'tansig';
    net.layers{2}.transferFcn = 'purelin';
    
    numCoeff = 63;
    wb = rand(numCoeff,1)-rand(numCoeff,1);
    net = setwb(net,wb);
    for wbL = 1:length(wb)
        nets(wbL,g)= wb(wbL);
    end
    [flag,inputFlags,outputFlags] = isconfigured(net);
   
    M = 1;
    S = 0;
    count = 0;
    while x < envLength
        
        [x,y,theta,X,Y] = updatePos(M,S,stepSize,theta,x,y,carWidth,carLength);
        if checkCrash(environment,X,Y) || count == 1000 %Set desired stop condition(s)
            break;
        end
        
        [s1,s2,s3,s4,s5] = getSensorData(environment,x,y,theta,carWidth,carLength);
        input = [s1;s2;s3;s4;s5;M;S];
        output = sim(net,input);
        M = output(1);
        S = output(2);
        
        count = count + 1;
    end
    nets(numCoeff + 1,g) = x;
end

csvwrite('netCoeffsInitial.dat',nets);
