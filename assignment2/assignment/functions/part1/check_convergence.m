function [has_converged, tol_iter] = check_convergence(Mu, Mu_previous, iter, tol_iter, MaxIter, MaxTolIter, tolerance)
%CHECK_CONVERGENCE Check if the kmeans main loop has converged to a
%solution
%
%   input -----------------------------------------------------------------
%   
%       o Mu : Current value of the centroids
%       o Mu_previous : Previous value of the centroids
%       o iter : Current number of iterations
%       0 tol_iter : Number of iterations since Mu = Mu_previous
%       o MaxIter : Maximum number of iterations
%       o MaxTolIter : Maximum number of iterations for stabilization (Mu =
%       Mu_previous)
%       o tolerance : tolerance for considering Mu = Mu_previous
%
%   output ----------------------------------------------------------------
%
%       o has_converged : true if one of the convergence situation is met
%       o tol_iter : previous tol_iter incremented if stabilization but no
%       convergence, 0 otherwise
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
has_converged=0;
[N M]=size(Mu);
condition= Mu(:,:)<Mu_previous(:,:)+tolerance & Mu>Mu_previous-tolerance; %check if mu_prev ~= mu_now
check=ones(N,M);
if  isequal(condition,check) % if mu_prev ~= mu_now -> tol_iter incremented 
    tol_iter=tol_iter+1;     
    if tol_iter>=MaxTolIter % check first condition for has_converged=1
        has_converged=1; % true equal 1
        tol_iter=0;
    end
end 

if iter>=MaxIter  % check second condition for has_converged=1
    has_converged=1; % true equal 1
    tol_iter=0;
end




end
