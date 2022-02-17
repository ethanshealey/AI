%{

hw4(data, k)

==========================================

Created by: Ethan Shealey
Parameters: 
    • data:
        NxP data matrix
        N is number of data points
        P is dimension of data points
    • k:
        Number of clusters to generate
Return Values:
    • idx:
        Nx1 data matrix containing cluster index for each row in data
    • c:
        KxP data matrix containing k cluster centroids

%}

function [idx,c] = hw4(data,k)

    % Initialize the Centroids
    centroids = zeros(k, size(data, 2));
    randidx = randperm(size(data, 1));
    centroids = data(randidx(1:k), :);

    % Get the Closest Centroids
    sz = size(centroids, 1);
    indicies = zeros(size(data, 1), 1);
    m = size(data, 1);

    for i = 1:m
        ind = 1;
        min_dist = sum((data(i,:) - centroids(1,:)) .^ 2);
        for j = 2:sz
            dist = sum((data(i,:) - centroids(j,:)) .^ 2);
            if(dist < min_dist)
                min_dist = dist;
                ind = j;
            end
        end
        indicies(i) = ind;
    end

    % Recompute the Centroids
    centers = zeros(k, size(data, 2));

    for i = 1:k
        datai = data(indicies==i,:);
        ck = size(datai, 1);
        centers(i, :) = (1/ck) * sum(datai);
    end

    % Prepare return values
    idx = indicies;
    c = centers;

end

