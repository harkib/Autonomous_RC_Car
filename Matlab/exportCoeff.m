%% exportCoeff, creates a csv with one set of coefficents to be use by the car
clear;
clc;
addpath('CoeffArchive');

%Adjust per run
readFrom = 'CoeffArchive\netCoeffsEvolve_May17.dat';
writeTo = 'CoeffArchive\netCoeffsEvolve_May17_export.csv';

nets = csvread(readFrom);

batchSize = length(nets(1,:));
coeffSize = length(nets(:,1)) - 1;
maxIndex = 1;
for o = 1:batchSize
    if nets(coeffSize + 1,o) > nets(coeffSize + 1,maxIndex)
        maxIndex = o;
    end
end

netOut = nets(1:coeffSize,maxIndex);
csvwrite(writeTo,netOut);

