function [netsNew] = evolve(nets)
n = length(nets(:,1));
nets = -(sortrows((-nets)',n))';
topP = (length(nets(1,:)))^.5;
netsNew = zeros(n,length(nets(1,:)));
for i = 1:topP
    set1 = nets(1:n-1,i);
    for j = 1:topP
        set2 = nets(1:n-1,j);
        set3 = mate(set1,set2);
        for k=1:length(set3)
            if i == j && i > topP/2 && 0 %should not enter
                disp(['shoulf not enter']);
                netsNew(k,(i-1)*topP + j) = rand - rand;
            else
                netsNew(k,(i-1)*topP + j) = set3(k);
            end
        end
    end
end
end
