%{

hw4(data, k)

==========================================

Created by: Ethan Shealey

This function is meant to replicate the 
function of the built in kmeans 

Parameters: 
    • data:
        A NxP data matrix where N is 
        number of data points and P is 
        dimension of data points
    • k:
        Number of clusters to generate

Return Values:
    • idx:
        Nx1 data matrix containing cluster 
        index for each row in data
    • c:
        KxP data matrix containing k cluster 
        centroids

%}

function [idx,c] = hw4(data,k)

    % Initialize the Centroids matrix
    centroids = zeros(k, size(data, 2));

    % Get random points and fill matrix
    randidx = randperm(size(data, 1));
    centroids = data(randidx(1:k), :);

    % Get the Closest Centroids
    sz = size(centroids, 1);
    indicies = zeros(size(data, 1), 1);

    % Get size of data
    m = size(data, 1);

    % Iterate through each point
    for i = 1:m
        ind = 1;
        % start with the first point as min distance
        min_dist = sum((data(i,:) - centroids(1,:)) .^ 2);
        for j = 2:sz
            % check if this point is closer, if so replace variable
            dist = sum((data(i,:) - centroids(j,:)) .^ 2);
            if(dist < min_dist)
                min_dist = dist;
                ind = j;
            end
        end
        % add to indicies array
        indicies(i) = ind;
    end

    % Recompute the Centroids
    centers = zeros(k, size(data, 2));

    % Iterate through each cluster
    for i = 1:k
        % Recalc centers
        datai = data(indicies==i,:);
        ck = size(datai, 1);
        centers(i, :) = (1/ck) * sum(datai);
    end

    % Prepare return values
    idx = indicies;
    c = centers;

end

