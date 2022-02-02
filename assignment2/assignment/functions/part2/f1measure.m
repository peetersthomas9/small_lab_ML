function [F1_overall, P, R, F1] =  f1measure(cluster_labels, class_labels)
%MY_F1MEASURE Computes the f1-measure for semi-supervised clustering
%
%   input -----------------------------------------------------------------
%   
%       o class_labels     : (1 x M),  M-dimensional vector with true class
%                                       labels for each data point
%       o cluster_labels   : (1 x M),  M-dimensional vector with predicted 
%                                       cluster labels for each data point
%   output ----------------------------------------------------------------
%
%       o F1_overall      : (1 x 1)     f1-measure for the clustered labels
%       o P               : (nClusters x nClasses)  Precision values
%       o R               : (nClusters x nClasses)  Recall values
%       o F1              : (nClusters x nClasses)  F1 values
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k=length(unique(cluster_labels)); % number of cluster 
c=length(unique(class_labels));   % number of class


for i=1:c
    [u I]=find(class_labels==i); % I is the index of each data corresponding to the i-class label
    for j=1:k
        number_of_point_in_cluster(j)=sum(cluster_labels(:)==j); %correspont to k
        number_of_point_in_class(i)=sum(class_labels(:)==i); % correspond to c(i)
       
        n(i,j)=sum(cluster_labels(I)==j); % sum of member of class i and cluster j
        R(i,j)=n(i,j)/number_of_point_in_class(i); %compute R
        P(i,j)=n(i,j)/number_of_point_in_cluster(j); %compute P
        
        F1(i,j)=2*R(i,j)*P(i,j)/(R(i,j)+P(i,j)); %formula given in the Lab 
        F1(isnan(F1))=0;

    end
    coef(i)=sum(class_labels(:)==i)/length(class_labels); %correspond to |c|/M
    clear u
    clear I
end
maxF1=max(F1,[],2);
F1_overall=dot(coef,maxF1);

R=R.';      %to get [nClusters x nClasses]
P=P.';      %to get [nClusters x nClasses]
F1=F1.';    %to get [nClusters x nClasses]

end
