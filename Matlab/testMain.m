%%testing 
readFrom = 'CoeffArchive\netCoeffsEvolve_May17.dat';
nets = csvread(readFrom); 
net = loadNet(nets,1);
% wb = zeros(1,63);
% wb(3) = 1;
% wb(54) = 1;
%net = setwb(net,wb);
in = [2;2;2;2;2;2;2];
for j = 1:length(in)
   i = j -1;
   
   in(j) = .3 - i*5;
end

%in = [1;0;0;0;0;0;0];
sim(net,in)