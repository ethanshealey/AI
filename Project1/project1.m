%{
    Ethan Shealey
    project1(imageFileName, k)
    =======================================================
    This function is intended to seperate tumor regions
    from the rest of an MRI image by using the Fuzzy C-Means
    algorithm. After getting each clustered image from the 
    original, find which has the greatest average red value.

    Parameters:
        • imageFileName: the name of the file to be clustered
        • k: the number of clusters to produce

    Output:
        • Saves an image called "<imageFileName>-tumor.jpg" to the same
          folder that program is in
        • Displays the new image to the screen

    
%}

function project1(imageFileName, k)

    % read in the image
    img = double(imread(imageFileName));
    
    % get the 3 dimensions 
    [rows, cols, dims] = size(img);

    % reshape to enable FCM usage
    img = reshape(img, rows*cols, dims);
    
    % call FCM and store its returned values
    [~, U] = fcm(img, k);

    % get maximum values and their indicies from U
    [~, idx] = max(U);

    max_red = 0;
   
    for i = 1:k
        % initialize a vector of false of the same length of index
        subindex = false(1, length(idx));
        % Set the positions belonging to the ith cluster to true
        subindex(idx==i) = true;
        % initialize an list of all black pixels. The list size is (row*col)-by-cs
        subimage_list = zeros(rows*cols, dims);
        % put the pixels belonging to ith cluster into the subimage list
        subimage_list(subindex, :) = img(subindex, :);
        % reshape the subimage into the size of the input image
        subimage = reshape(subimage_list, rows, cols, dims); 

        % get indexs of background to remove
        background = rgb2gray(subimage);
        background_idx = background == 0;

        % get the red values from clustered image (above 200)
        reds = subimage(:,:,1) > 200;

        % get the average red value, not including background
        red_avg = uint8(mean(reds(~background_idx)));

        % check images red value against the previously stored
        % average
        if red_avg > max_red
            % if more red, save the new mean red value and
            % save the image to be displayed if remains the largest
            max_red = red_avg;
            max_red_img = subimage;
        end
    end
    % Save the image as <original-filname>-tumor.jpg
    fn = split(imageFileName, '.');
    imwrite(uint8(max_red_img), [fn{1} '-tumor.jpg'])
    % Show the image determined to be most likely the tumor
    imshow(uint8(max_red_img));
end