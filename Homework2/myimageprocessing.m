% Created by Ethan shealey

function count = myimageprocessing(img,t)
    A = imread(img);
    I = A <= t;
    J = A > t;
    avg = [mean(A(I)), mean(A(J))];
    A(I) = avg(1);
    A(J) = avg(2);
    count = [sum(sum(I)), sum(sum(J))];
    imwrite(A, ['result_' num2str(t) '.png']);
end

