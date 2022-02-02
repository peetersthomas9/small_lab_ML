function [E] = cost_function(Y, Yd, type)
%COST_FUNCTION compute the error between Yd and Y
%   inputs:
%       o Y (PxM) Output of the last layer of the network, should match
%       Y
%       o Yd (PxM) Ground truth
%       o type (string) type of the cost evaluation function
%   outputs:
%       o E (scalar) The error
% 
[P M]=size(Y);
% 
% [x1 y1]=find(Y==1);
% if isempty(x1)
% else
%     Y(x1,y1)=0.99;
% end
% [x0 y0]=find(Y==0);
% if isempty(x0)
% else
%     Y(x0,y0)=0.01;
% end

switch type
    case "LogLoss"
        for i=1:M
            % Assume that P is equal to 1
            a=Yd(1,i)*log(Y(1,i));

            b=(1-Yd(1,i))*log(1-Y(1,i));
            
            e(1,i)=a+b;

        end
        E=-1/M*sum(e);
    case "CrossEntropy"
        E=-1/M*sum(sum(Yd.*log(Y),2),1);
end
end

