function [net] = loadNet(nets,index)
        biasConnect = [0;0];
        inputConnect = [1 1 1 1 1 1 1;0 0 0 0 0 0 0];
        layerConnect = [0 0; 1 0];
        outputConnect = [0 1];
        net = network(7,2,biasConnect,inputConnect,layerConnect, outputConnect);
        net.layers{1}.size = 7;
        net.layers{2}.size = 2;
        net.inputs{1}.range = [0 100];
        net.inputs{2}.range = [0 100];
        net.inputs{3}.range = [0 100];
        net.inputs{4}.range = [0 100];
        net.inputs{5}.range = [0 100];
        net.inputs{6}.range = [0 300];
        net.inputs{7}.range = [-45 45];
        net.layers{1}.transferFcn = 'tansig';
        net.layers{2}.transferFcn = 'purelin';
        
        
        for h=1:length(nets(:,1))-1
            wb(h) = nets(h,index);
        end
        net = setwb(net,wb);
end

