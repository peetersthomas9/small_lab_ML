function [ y_est ] =  knn(X_train,  y_train, X_test, params)
%MY_KNN Implementation of the k-nearest neighbor algorithm
%   for classification.
%
%   input -----------------------------------------------------------------
%   
%       o X_train  : (N x M_train), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o y_train  : (1 x M_train), a vector with labels y \in {1,2} corresponding to X_train.
%       o X_test   : (N x M_test), a data set with M_test samples each being of dimension N.
%                           each column corresponds to a datapoint
%       o params : struct array containing the parameters of the KNN (k, d_type)
%
%   output ----------------------------------------------------------------
%
%       o y_est   : (1 x M_test), a vector with estimated labels y \in {1,2} 
%                   corresponding to X_test.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[N M_train]=size(X_train);
[N M_test] =size(X_test);
k=params.k;

for j=1:M_test % loop to compute y for each sample 
    for i=1:M_train % loop to compute distance between the j sample test and the sample train
        d(i,j)=compute_distance(X_train(:,i),X_test(:,j),params);
    end
    [d_sort ind]=sort(d(:,j),'ascend'); % ind will give us the closest training sample
    y_label=y_train(ind(1:k));
    val=unique(y_label);
    for m=1:length(val) % 2 loops to compute which class appears the most 
        nbr(m)=0;
        for l=1:k
            if val(m)==y_label(l);
                nbr(m)=nbr(m)+1;
            end
        end
    end
    [val_max ind_max]=max(nbr);
    y_est(j)=val(ind_max);
    
    clear nbr
    clear val
    clear d_sort
    clear ind 
    clear y_label
    clear val_max
    clear ind_max
end







end