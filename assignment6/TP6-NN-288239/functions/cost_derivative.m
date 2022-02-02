function [dZ] = cost_derivative(Y, Yd, typeCost, typeLayer)
%COST_DERIVATIVE compute the derivative of the cost function w.r.t to the Z
%value of the last layer
%   inputs:
%       o Y (PxM) Output of the last layer of the network, should match
%       Yd
%       o Yd (PxM) Ground truth
%       o typeCost (string) type of the cost evaluation function
%       o typeLayer (string) type of the last layer
%   outputs:
%       o dZ (PxM) The derivative dE/dZL


% Use for debug : 



switch typeCost
    
    % found the formulas in the slide same value for both of the method 
    case "LogLoss"

            
            dZ=Y-Yd;
            

    case "CrossEntropy"
            
            dZ=Y-Yd;
end




end

