function [set3] = mate(set1,set2)
set3 = zeros(length(set1),1);
for i=1:length(set1)
   proportion = rand(1,1);
   set3(i) =  (set1(i)*proportion + set2(i)*(1-proportion));
end
end

