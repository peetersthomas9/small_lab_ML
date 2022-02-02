function [dZ, dW, dW0] = backward_pass(dE, W, A, Z, Sigmas)
%BACKWARD_PASS This function calculate the backward pass of the network with
%   inputs:
%       o dE (PxM) The derivative dE/dZL
%       o W {Lx1} cell array containing the weight matrices for all the layers 
%       o b {Lx1} cell array containing the bias matrices for all the layers
%       o A {L+1x1} cell array containing the results of the activation functions
%       at each layer. Also contain the input layer A0
%       o Z {Lx1} cell array containing the Z values at each layer
%       o Sigmas {Lx1} cell array containing the type of the activation
%       functions for all the layers
%
%   outputs:
%       o dZ {Lx1} cell array containing the derivatives dE/dZl values at each layer
%       o dW {Lx1} cell array containing the derivatives of the weights at
%       each layer
%       o dW0 {Lx1} cell array containing the derivatives of the bias at each layer
L=size(Z,1);

%debug : 
% for i=1:L
% [I J]=find(isnan(W{i,1}));
% if isempty(I) 
% else
%     a=2
% end
% 
% 
% 
% [I J]=find(isnan(A{i,1}));
% if isempty(I) 
% else
%     a=2
% end
% end



[P M]=size(dE);
dZ{L,1}=dE;
dW0{L,1}=1/M*sum(dZ{L,1},2); 
dW{L,1}=1/M*dE*A{L,1}.';


for i=L-1:-1:1
    dAZ{i,1}=backward_activation(Z{i,1}, Sigmas{1,i});
    
    dZ{i,1}=W{i+1,1}.'*dZ{i+1,1}.*dAZ{i,1};
       

    
    dW0{i,1}=1/M*sum(dZ{i,1},2);
        
    
    dW{i,1}=1/M*dZ{i,1}*A{i,1}.';
    

end

