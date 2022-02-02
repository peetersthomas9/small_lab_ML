function [ Sigma ] = compute_covariance( X, X_bar, type )
%MY_COVARIANCE computes the covariance matrix of X given a covariance type.
%
% Inputs -----------------------------------------------------------------
%       o X     : (N x M), a data set with M samples each being of dimension N.
%                          each column corresponds to a datapoint
%       o X_bar : (N x 1), an Nx1 matrix corresponding to mean of data X
%       o type  : string , type={'full', 'diag', 'iso'} of Covariance matrix
%
% Outputs ----------------------------------------------------------------
%       o Sigma : (N x N), an NxN matrix representing the covariance matrix of the 
%                          Gaussian function
%%
[N M]=size(X);
switch type
    case 'full'  
        Sigma=1/(M-1)*(X-X_bar)*(X-X_bar).';

    case 'diag' 
        Sigma_full=1/(M-1)*(X-X_bar)*(X-X_bar).';
        Sigma=diag(diag(Sigma_full));
    case 'iso'
        s=1/(N*M)*sum(diag((X-X_bar).'*(X-X_bar)));
        Sigma=eye(N)*s;
    otherwise
        warning('Unexpected type. No Sigma computed.')
end



end





