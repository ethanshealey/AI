% Created by Ethan shealey

function count = myimageprocessing(img,t)
    % Get data from image file
    img = imread(img);
    % Get logical arrays for above and below
    % desired gray level (t)
    I = img <= t;
    J = img > t;
    % find the mean average for each of the
    % gray levels
    avg = [mean(img(I)), mean(img(J))];
    % Replace the values in the image with
    % the mean gray value, cast to unit8
    img(I) = uint8(avg(1));
    img(J) = uint8(avg(2));
    % Setup the return value
    count = [sum(sum(I)), sum(sum(J))];
    % Write the new image to the respective file:
    % result_<t-value>.png
    imwrite(img, ['result_' num2str(t) '.png']);
end