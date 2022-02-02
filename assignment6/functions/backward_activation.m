function [dZ] = backward_activation(Z, Sigma)
%BACKWARD_ACTIVATION Compute the derivative of the activation function
%evaluated in Z
%   inputs:
%       o Z (NxM) Z value, input of the activation function. The size N
%       depends of the number of neurons at the considered layer but is
%       irrelevant here.
%       o Sigma (string) type of the activation to use
%   outputs:
%       o dZ (NXM) derivative of the activation function

[N,M]=size(Z);
switch Sigma
    case "sigmoid"
        %formula for the derivative of the sigmoid : 
        dZ=exp(-Z)./((1+exp(-Z)).^2);
        

    case "tanh"
        
        %A=(exp(Z)-exp(-Z))./(exp(Z)+exp(-Z));
        %dZ=1-tanh(Z)^2  
        tanhZ=(exp(Z)-exp(-Z))./(exp(Z)+exp(-Z));
        dZ=1-tanhZ.^2;


        
     case "relu"
        for i=1:N
            for j=1:M
                if Z(i,j)>=0
                    dZ(i,j)=1;
                else
                    dZ(i,j)=0;
                end
            end
        end
     case "leakyrelu"
        k=0.01;
        for i=1:N
            for j=1:M
                if Z(i,j)>=0
                    dZ(i,j)=1;
                else
                    dZ(i,j)=k;
                end
            end
        end

        
end
end








