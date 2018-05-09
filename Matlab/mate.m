function [set3] = mate(set1,set2)
set3 = zeros(length(set1),1);
for i=1:length(set1)
   proportion = rand;
   mutate = rand - rand;
   set3(i) =  (set1(i)*proportion + set2(i)*(1-proportion));
   if abs(mutate) > .75
      set3(i) = set3(i) + set3(i)*mutate/15; 
   end
end
end

