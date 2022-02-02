function [cr, compressedSize] = compression_rate(img,cimg,ApList,muList)
%COMPRESSION_RATE Calculate the compression rate based on the original
%image and all the necessary components to reconstruct the compressed image
%
%   input -----------------------------------------------------------------
%       o img : The original image   
%       o cimg : The compressed image
%       o ApList : List of projection matrices for each independent
%       channels
%       o muList : List of mean vectors for each independent channels
%
%   output ----------------------------------------------------------------
%
%       o cr : The compression rate
%       o compressedSize : The size of the compressed elements

% calculation of the comression rate
compressedSize=(numel(cimg)+numel(ApList)+numel(muList))*64;
cr=1-compressedSize/(numel(img)*64);

% convert the size to megabits
compressedSize = compressedSize / 1048576; 
end

