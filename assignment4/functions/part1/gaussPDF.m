function prob = gaussPDF(X, Mu, Sigma)
%MY_GAUSSPDF computes the Probability Density Function (PDF) of a
% multivariate Gaussian represented by a mean and covariance matrix.
%
% Inputs -----------------------------------------------------------------
%       o X     : (N x M), a data set with M samples each being of dimension N.
%                          each column corresponds to a datapoint
%       o Mu    : (N x 1), an Nx1 vector corresponding to the mean of the 
%							Gaussian function
%       o Sigma : (N x N), an NxN matrix representing the covariance matrix 
%						   of the Gaussian function
% Outputs ----------------------------------------------------------------
%       o prob  : (1 x M),  a 1xM vector representing the probabilities for each 
%                           M datapoints given Mu and Sigma    
%%
[N M]=size(X);
coeff=1/((2*pi)^(N/2)*sqrt(det(Sigma)));
for i=1:M
    %formula for the probability density function of a  K -component GMM
    prob(1,i)=coeff*expm(-1/2*(X(:,i)-Mu).'*inv(Sigma)*(X(:,i)-Mu)); 
end 

end