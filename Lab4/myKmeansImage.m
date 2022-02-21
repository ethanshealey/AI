% Created by Ethan Shealey

%{

-------------------------------------------
myKmeansImages

This function takes in an image and 
clusters the pixels by using kmeans.
The number of clusters is determined
by the parameter k

Parameters:
img : the path to the image 
      (i.e /path/to/image.jpg)
k   : the number of clusters to calculate
      this is the number of unique RGB 
      values that will be mapped into the 
      original image
      (i.e 16 for 16 RGB clusters)
-------------------------------------------

%}

function myKmeansImage(img,k)
    % read in the RGB values of the image
    A = double(imread(img));
    % get the row and column size
    % NOTE: z is needed to properly disperse the dimensions
    %       but will remain unused
    [r,c,z] = size(A);
    % reshape the image to get each RGB value grouping
    A = reshape(A, [r * c, 3]);
    % use the built in kmeans function to get the IDX
    % and mean values for pixels
    [IDX, means] = kmeans(A, k);
    % get the clustered values from the IDX
    newc = means(IDX, :);
    % reshape new RGB values back into original image size
    newi = reshape(newc, [r,c,3]);
    % display image
    imshow(uint8(round(newi)))
end

