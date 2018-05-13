%%main
clear;
clc;
addpath('CoeffArchive');

%Adjust per run , also adjust stop conditions and score coditions
readFrom = 'CoeffArchive\netCoeffsEvolve_May11.dat';
writeTo = 'CoeffArchive\netCoeffsEvolve_May12.dat';
numGens = 30;

nets = csvread(readFrom);


[environment,envLength] = genEnvironment3();
[carWidth, carLength, stepSize] = constants();

for f = 1:numGens
    nets = evolve(nets);
    batchSize = length(nets(1,:));
   
    for r = 1:batchSize
        clc;
        disp(['Simulating net ', num2str(r), ' of ',num2str(batchSize),' : Generation ',num2str(f) ' of ', num2str(numGens)]);  
        net = loadNet(nets,r);
        
        theta = 0;
        x = 50;
        y = 2400;
        M = 0;
        S = 0;
        count = 0;
        while x < envLength
            
            [x,y,theta,X,Y] = updatePos(M,S,stepSize,theta,x,y,carWidth,carLength);
            if checkCrash(environment,X,Y) || (x > 2450 && y < 400) || count == 10000% stop conditions
                break;
            end
            
            [s1,s2,s3,s4,s5] = getSensorData(environment,x,y,theta,carWidth,carLength);
            input = [s1;s2;s3;s4;s5;M;S];
            output = sim(net,input);
            M = output(1);
            S = output(2);
            count = count + 1;
        end
            nets(64,r)= score3(x,y);
    end
end
csvwrite(writeTo,nets);

%% watch
clc;

maxIndex = 1;
for o = 1:batchSize
    if nets(64,o) > nets(64,maxIndex)
        maxIndex = o;
    end
end
maxIndex = 6;
net = loadNet(nets,maxIndex);

x = 50;
y = 2400;
theta = 0;
M = 0;
S = 0;
count = 0;
while x < envLength
    
    [x,y,theta,X,Y] = updatePos(M,S,stepSize,theta,x,y,carWidth,carLength);
    if mod(count,2) == 0
        scatter(environment(1,:),environment(2,:),'.');
        daspect([1 1 1])
        hold on;
        drawCar(X,Y);
        pause(0.005);
    end
    if checkCrash(environment,X,Y) || count == 100000
        break;
    end
    
    [s1,s2,s3,s4,s5] = getSensorData(environment,x,y,theta,carWidth,carLength);
    input = [s1;s2;s3;s4;s5;M;S];
    output = sim(net,input);
    M = output(1);
    S = output(2);
    
    
    count = count + 1;
end
count