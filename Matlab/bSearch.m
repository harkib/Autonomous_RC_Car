function [found] = bSearch(matrix,x,y,tolerance)

%%check sorted
% sorted = 1;
% for i=2:length(matrix(1,:))
%    if matrix(1,i-1) > matrix(1,i)
%        sorted = 0;
%    end
% end
% if sorted == 0
%     disp(['not sorted']);
%     found = 1;
% end 
found = 0;
first = 1;
last = length(matrix(1,:));
finish = 0;
while first < last && finish ~= 1
    mid = floor((first+last)/2);
    if (matrix(1,mid) > x - tolerance) && (matrix(1,mid) < x + tolerance)
        xUp = x;
        xL = x;
        xUpIndex = mid;
        xLIndex = mid;
        while (xUp < (x + tolerance)) && (xUp > (x - tolerance))
            if matrix(2,xUpIndex) < (y + tolerance) && matrix(2,xUpIndex) > (y - tolerance)
                found = 1;
                finish = 1;
            end
            xUpIndex = xUpIndex + 1;
            if xUpIndex == 0 || xUpIndex == (length(matrix(1,:))+1)
                break;
            end
            xUp = matrix(1,xUpIndex);
        end
        while xL < (x + tolerance) && xL > (x - tolerance) && found == false
            if matrix(2,xLIndex) < (y + tolerance) && matrix(2,xLIndex) > (y - tolerance)
                found = 1;
                finish = 1;
            end
            xLIndex = xLIndex + 1;
            if xLIndex == 0 || xLIndex == (length(matrix(1,:))+1)
                break;
            end
            xL = matrix(1,xLIndex);
        end
        finish = 1;
    elseif x > matrix(1,mid)
        first = mid+1;
    elseif x  <  matrix(1,mid)
        last = mid-1;
    end
end


end

