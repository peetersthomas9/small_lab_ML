function [cimg, ApList, muList] = compress_image(img, p)
%COMPRESS_IMAGE Compress the image by applying the PCA over each channels 
% independently
%
%   input -----------------------------------------------------------------
%   
%       o img : (width x height x 3), an image of size width x height over RGB channels
%       o p : The number of components to keep during projection 
%
%   output ----------------------------------------------------------------
%
%       o cimg : (p x height x 3) The projection of the image on the eigenvectors
%       o ApList : (p x width x 3) The projection matrices for each channels
%       o muList : (width x 3) The mean vector for each channels

% compute PCA
[Mu1, C1, V1, EigenValues1] = compute_pca(img(:,:,1));
[Mu2, C2, V2, EigenValues2] = compute_pca(img(:,:,2));
[Mu3, C3, V3, EigenValues3] = compute_pca(img(:,:,3));

%Project PCA
[Y1, Ap1] = project_pca(img(:,:,1), Mu1, V1, p);
[Y2, Ap2] = project_pca(img(:,:,2), Mu2, V2, p);
[Y3, Ap3] = project_pca(img(:,:,3), Mu3, V3, p);

% Output values : 
ApList(:,:,1)=Ap1;
ApList(:,:,2)=Ap2;
ApList(:,:,3)=Ap3;

muList=[Mu1,Mu2,Mu3];

cimg(:,:,1)=Y1;
cimg(:,:,2)=Y2;
cimg(:,:,3)=Y3;
end

