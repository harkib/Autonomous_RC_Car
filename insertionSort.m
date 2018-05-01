function [matrix] = insertionSort(matrix)
%sorts a 2 x n matrix, (1,n) is sorted least to greatest
for i=2:length(matrix(1,:))
    tempX = matrix(1,i);
    tempY = matrix(2,i);
    pos = i;
    while pos > 1 && matrix(1,pos-1) > tempX
        matrix(1,pos) = matrix(1,pos -1);
        matrix(2,pos) = matrix(2,pos -1);
        pos = pos -1;
    end
    matrix(1,pos) = tempX;
    matrix(2,pos) = tempY;
end
end

