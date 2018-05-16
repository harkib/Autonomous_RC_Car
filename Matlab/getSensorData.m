function [s1,s2,s3,s4,s5] = getSensorData(environment,x0,y0,theta0,carWidth,carLength)
stepSize = 3;
tolerance = 2;
sensorAngleFront = 30*(pi/180);%for S2 and S3, side sensors at 90 degrees (S4 S5)
sensorAngleSide = 90*(pi/180);
sensorMax = 500;
s1 = sensorMax;
s2 = sensorMax;
s3 = sensorMax;
s4 = sensorMax;
s5 = sensorMax;

s1a = zeros([2,round(sensorMax/stepSize)]);
s2a = zeros([2,round(sensorMax/stepSize)]);
s3a = zeros([2,round(sensorMax/stepSize)]);
s4a = zeros([2,round(sensorMax/stepSize)]);
s5a = zeros([2,round(sensorMax/stepSize)]);

for i=1:stepSize:sensorMax
    s1a(1,i) = x0 + i*cos(theta0);
    s1a(2,i) = y0 + i*sin(theta0);
    s2a(1,i) = x0 + i*cos(theta0+sensorAngleFront);
    s2a(2,i) = y0 + i*sin(theta0+sensorAngleFront);
    s3a(1,i) = x0 + i*cos(theta0-sensorAngleFront);
    s3a(2,i) = y0 + i*sin(theta0-sensorAngleFront);
    s4a(1,i) = x0 + i*cos(theta0+sensorAngleSide);
    s4a(2,i) = y0 + i*sin(theta0+sensorAngleSide);
    s5a(1,i) = x0 + i*cos(theta0-sensorAngleSide);
    s5a(2,i) = y0 + i*sin(theta0-sensorAngleSide);
end

for i=1:length(environment(1,:))
    for j = 1:length(s1a)
        if abs(environment(1,i) - s1a(1,j)) < tolerance && abs(environment(2,i) - s1a(2,j)) < tolerance
            tempSx = s1a(1,j);
            tempSy = s1a(2,j);
            tempS = sqrt((x0 - tempSx)^2 + (y0 - tempSy)^2);
            if tempS < s1
                s1 = tempS;
            end
        end
    end
end
for i=1:length(environment)
    for j = 1:length(s2a)
        if abs(environment(1,i) - s2a(1,j)) < tolerance && abs(environment(2,i) - s2a(2,j)) < tolerance
            tempSx = s2a(1,j);
            tempSy = s2a(2,j);
            tempS = sqrt((x0 - tempSx)^2 + (y0 - tempSy)^2);
            if tempS < s2
                s2 = tempS;
            end
        end
    end
end
for i=1:length(environment)
    for j = 1:length(s3a)
        if abs(environment(1,i) - s3a(1,j)) < tolerance && abs(environment(2,i) - s3a(2,j)) < tolerance
            tempSx = s3a(1,j);
            tempSy = s3a(2,j);
            tempS = sqrt((x0 - tempSx)^2 + (y0 - tempSy)^2);
            if tempS < s3
                s3 = tempS;
            end
        end
    end
end
for i=1:length(environment)
    for j = 1:length(s4a)
        if abs(environment(1,i) - s4a(1,j)) < tolerance && abs(environment(2,i) - s4a(2,j)) < tolerance
            tempSx = s4a(1,j);
            tempSy = s4a(2,j);
            tempS = sqrt((x0 - tempSx)^2 + (y0 - tempSy)^2);
            if tempS < s4
                s4 = tempS;
            end
        end
    end
end
for i=1:length(environment)
    for j = 1:length(s5a)
        if abs(environment(1,i) - s5a(1,j)) < tolerance && abs(environment(2,i) - s5a(2,j)) < tolerance
            tempSx = s5a(1,j);
            tempSy = s5a(2,j);
            tempS = sqrt((x0 - tempSx)^2 + (y0 - tempSy)^2);
            if tempS < s5
                s5 = tempS;
            end
        end
    end
end


s1 = s1 - carLength/2;
s2 = s2 - (carLength/2)/cos(sensorAngleFront);
s3 = s3 - (carLength/2)/cos(sensorAngleFront);
s4 = s4 - carWidth/2;
s5 = s5 - carWidth/2;