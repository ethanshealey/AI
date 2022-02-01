% Created by Ethan shealey

function count = myimageprocessing(img,t)
    img = imread(img);
    I = img <= t;
    J = img > t;
    avg = [mean(img(I)), mean(img(J))];
    img(I) = avg(1);
    img(J) = avg(2);
    count = [sum(sum(I)), sum(sum(J))];
    imwrite(img, ['result_' num2str(t) '.png']);
end
