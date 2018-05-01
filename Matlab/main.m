%%main
clear;
clc;
addpath('CoeffArchive');

%Adjust per run , also adjust stop conditions
readFrom = 'CoeffArchive\netCoeffsEvolve_Apr29.dat';
writeTo = 'CoeffArchive\netCoeffsEvolve_May1.dat';
numGens = 2;


nets = csvread(readFrom);


[environment,envLength] = genEnvironment2();
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
        y = 200;
        M = 0;
        S = 0;
        count = 0;
        while x < envLength
            
            [x,y,theta,X,Y] = updatePos(M,S,stepSize,theta,x,y,carWidth,carLength);
            if checkCrash(environment,X,Y) || (count > 1200 && x < 200) || x > 2400 || count == 12000% stop conditions
                break;
            end
            
            [s1,s2,s3,s4,s5] = getSensorData(environment,x,y,theta,carWidth,carLength);
            input = [s1;s2;s3;s4;s5;M;S];
            output = sim(net,input);
            M = output(1);
            S = output(2);
            count = count + 1;
        end
        nets(64,r)=x;
    end
end
csvwrite(writeTo,nets);
%% watch
maxIndex = 1;
for o = 1:batchSize
    if nets(64,o) > nets(64,maxIndex)
        maxIndex = o;
    end
end
net = loadNet(nets,maxIndex);

x = 800;
y = 200;
theta = 0;
M = 1;
S = 0;
count = 0;
while x < envLength
    
    [x,y,theta,X,Y] = updatePos(M,S,stepSize,theta,x,y,carWidth,carLength);
    if mod(count,20) == 0
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