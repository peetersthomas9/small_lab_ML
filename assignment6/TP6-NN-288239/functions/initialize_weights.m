function [W, W0] = initialize_weights(LayerSizes, type)
%INITIALIZE_WEIGHTS Initialize the wieghts of the network according to the
%desired type of initialization
%   inputs:
%       o LayerSizes{L+1x1} Cell array containing the sizes of each layers.
%       Also contains the size of A0 input layer
%       o type (string) type of the desired initialization ('random' or 'zeros')
%
%   outputs:
%       o W {Lx1} cell array containing the weight matrices for all the layers 
%       o W0 {Lx1} cell array containing the bias matrices for all the layers

L=size(LayerSizes,2)-1; % peut etre 2 et pas 1 dans size

%size of input layer : 
S(1)=LayerSizes{1};
switch type
    case "random"
        for i=2:L+1
           S(i)=LayerSizes{i};
           W{i-1,1}=randn(S(i),S(i-1));
           W0{i-1,1}=randn(S(i),1);
        end
    case "zeros"
        for i=2:L+1
           S(i)=LayerSizes{i};
           W{i-1,1}=zeros(S(i),S(i-1));
           W0{i-1,1}=zeros(S(i),1);
        end
end
            







end

