function [Xinversed] = denormalize(X, param1, param2, normalization)
%DENORMALIZE Denormalize the data wrt to the normalization technique passed in
%parameter and param1 and param2 calculated during the normalization step
%normalization step
%
%   input -----------------------------------------------------------------
%   
%       o X : (N x M), normalized data of M sample points of N features
%       o normalization : String indicating which normalization technique
%                         to use among minmax, zscore and none
%       o param1 : first parameter of the normalization 
%       o param2 : second parameter of the normalization
%
%   output ----------------------------------------------------------------
%
%       o Xinversed : (N x M), the denormalized data

% three different cases in function of the type of the type of
% normatlization
if strcmp(normalization,'minmax')
    Xinversed=(param2-param1).'*X+param1;  
end

if strcmp(normalization,'zscore')
    Xinversed=param2.'*X+param1;
    
end

if strcmp(normalization,'none')
    Xinversed=X;
    
end

end

