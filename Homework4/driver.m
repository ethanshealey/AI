%{

driver(data, k)

==========================================

Created By: Ethan Shealey

This function is intended to act as a 
driver for my hw4 function, this code
was taken from my Lab4 assignment
where we used kmeans to cluster and
recolor an image. In this instance
the kmeans function has been replaced by 
my hw4 function.

Parameters:
    • data:
        A NxP data matrix
    • k:
        Number of clusters to generate

%}

function driver(data,k)
    % read in the RGB values of the image
    A = double(imread(data));
    % get the row and column size
    % NOTE: z is needed to properly disperse the dimensions
    %       but will remain unused
    [r,c,~] = size(A);
    % reshape the image to get each RGB value grouping
    A = reshape(A, [r * c, 3]);
    % use the built in kmeans function to get the IDX
    % and mean values for pixels
    [IDX, means] = hw4(A, k);
    % get the clustered values from the IDX
    newc = means(IDX, :);
    % reshape new RGB values back into original image size
    newi = reshape(newc, [r,c,3]);
    % display image
    imshow(uint8(round(newi)))
end

