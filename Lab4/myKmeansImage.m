% Created by Ethan Shealey

function myKmeansImage(img,k)
    % read in the RGB values of the image
    A = double(imread(img));
    % get the row and column size
    [r,c,z] = size(A);
    % reshape the image to get each RGB value grouping
    A = reshape(A, [r * c, 3]);
    % use the built in kmeans function to get the IDX
    % and mean values for pixels
    [IDX, means] = kmeans(A, k);
    % get the average values from the IDX
    newc = means(IDX, :);
    % reshape new RGB values back into original image size
    newi = reshape(newc, [r,c,3]);
    % display image
    imshow(uint8(round(newi)))
end

