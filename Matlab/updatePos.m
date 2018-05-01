function [x,y,theta,X,Y] = updatePos(M,S, stepSize,theta0,x0,y0,carWidth,carLength)
% Update postion
 theta = theta0 + S*(pi/180);
 x = M*stepSize*cos(theta) + x0;
 y = M*stepSize*sin(theta) + y0;
 
 % Calculates Corners

thetaConst = atan(carWidth/carLength);
diagnolLength = sqrt((carLength/2)^2 + (carWidth/2)^2);

x1 = diagnolLength*cos(theta + thetaConst) + x;
x2 = diagnolLength*cos(theta - thetaConst) + x;
x3 = -diagnolLength*cos(theta + thetaConst) + x;
x4 = -diagnolLength*cos(theta - thetaConst) + x;

y1 = diagnolLength*sin(theta + thetaConst) + y;
y2 = diagnolLength*sin(theta - thetaConst) + y;
y3 = -diagnolLength*sin(theta + thetaConst) + y;
y4 = -diagnolLength*sin(theta - thetaConst) + y;

X = [x1 x2 x3 x4 x1];
Y = [y1 y2 y3 y4 y1];
end


