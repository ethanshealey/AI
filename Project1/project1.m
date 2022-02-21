% Ethan Shealey

function project1(imgFileName,k)
    img = double(imread(imgFileName));
    [r, c, ~] = size(img);
    img = reshape(img, [r * c, 3]);
    [centers, U] = fcm(img, k);
end