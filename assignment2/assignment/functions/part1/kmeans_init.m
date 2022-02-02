function [Mu] =  kmeans_init(X, k, init)
%KMEANS_INIT This function computes the initial values of the centroids
%   for k-means algorithm, depending on the chosen method.
%
%   input -----------------------------------------------------------------
%   
%       o X     : (N x M), a data set with M samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o k     : (double), chosen k clusters
%       o init  : (string), type of initialization {'sample','range'}
%
%   output ----------------------------------------------------------------
%
%       o Mu    : (D x k), an Nxk matrix where the k-th column corresponds
%                          to the k-th centroid mu_k \in R^N                   
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if strcmp('sample',init)==1
    Mu=datasample(X,k,2); %random sampling 
else    
    val_min=min(X,[],2);  %random in range 
    val_range=range(X,2);
    dt=val_range/1000;
    for i=1:k 
        for j=1:length(val_min)
            Mu(j,i)=randsample([val_min(j):dt:val_min(j)+val_range(j)],1); % select a point between value min and max in dimension j
        end
    end
end






end