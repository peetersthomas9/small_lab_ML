function [Priors,Mu,Sigma] = maximization_step(X, Pk_x, params)
%MAXIMISATION_STEP Compute the maximization step of the EM algorithm
%   input------------------------------------------------------------------
%       o X         : (N x M), a data set with M samples each being of 
%       o Pk_x      : (K, M) a KxM matrix containing the posterior probabilty
%                     that a k Gaussian is responsible for generating a point
%                     m in the dataset, output of the expectation step
%       o params    : The hyperparameters structure that contains k, the number of Gaussians
%                     and cov_type the coviariance type
%   output ----------------------------------------------------------------
%       o Priors    : (1 x K), the set of updated priors (or mixing weights) for each
%                           k-th Gaussian component
%       o Mu        : (N x K), an NxK matrix corresponding to the updated centroids 
%                           mu = {mu^1,...mu^K}
%       o Sigma     : (N x N x K), an NxNxK matrix corresponding to the
%                   updated Covariance matrices  Sigma = {Sigma^1,...,Sigma^K}
%%
[N M]=size(X);
[K M]=size(Pk_x);
%compute priors : 
Priors=[1/M*sum(Pk_x,2)].';

%compute Mu :
Mu=X*Pk_x.'./sum(Pk_x,2).';

%compute Sigma 
switch params.cov_type
    case 'full'
        for i=1:K
            Sigma_num(:,:,i)=zeros(N);
            for j=1:M
                Sigma_num(:,:,i)=Sigma_num(:,:,i)+Pk_x(i,j)*(X(:,j)-Mu(:,i))*(X(:,j)-Mu(:,i)).';        
            end
            Sigma(:,:,i)=Sigma_num(:,:,i)/sum(Pk_x(i,:),2)+eye(N)*10^(-5);
        end
    case 'diag'
        for i=1:K
            Sigma_num(:,:,i)=zeros(N);
            for j=1:M
                Sigma_num(:,:,i)=Sigma_num(:,:,i)+Pk_x(i,j)*(X(:,j)-Mu(:,i))*(X(:,j)-Mu(:,i)).';        
            end
            Sigma_full(:,:,i)=Sigma_num(:,:,i)/sum(Pk_x(i,:),2)+eye(N)*10^(-5);
            Sigma(:,:,i)=diag(diag(Sigma_full(:,:,i)));
        end
    case 'iso'
        for i=1:K
            Sigma_num(i)=0;
            for j=1:M
                Sigma_num(i)=Sigma_num(i)+Pk_x(i,j)*(X(:,j)-Mu(:,i)).'*(X(:,j)-Mu(:,i));       
            end
            Sigma(:,:,i)=eye(N)*Sigma_num(i)/(N*sum(Pk_x(i,:),2))+eye(N)*10^(-5);
        end
    otherwise
        warning('Unexpected type. No Sigma computed.')
end




end

