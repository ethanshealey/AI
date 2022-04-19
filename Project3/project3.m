%{
    project3()
    Created by Ethan Shealey
    ===================================================
    This program is inteded to take in a large number
    of images from a given location. That set of images
    will be split 70/30 into training and testing sets
    and used to create a convolutional neural network 
    to classify malware instances using those 2d images
 
    Inputs:
        • None
    Outputs:
        • accuracy : the accuracy of the CNN on the
                     testing set
%}

function accuracy = project3()
 
    % Load in data
    imds = imageDatastore("/ocean/projects/cis220009p/shared/Data", ...
        "IncludeSubfolders", true, "LabelSource", "foldernames");
    
    % Split the data into training and testing sets then
    % augment those sets to make them the same sizes
    [train, test] = splitEachLabel(imds, .7, 'randomize');
    auTrain = augmentedImageDatastore([128 128 1], train);
    auTest = augmentedImageDatastore([128 128 1], test);
    
    % Setup the layers
    layers = [...
        imageInputLayer([128 128 1]), ...
        convolution2dLayer(20, 5, 'Stride', 1, 'Padding', 'same'), ...
        batchNormalizationLayer, reluLayer, maxPooling2dLayer(2, 'Stride', 2), ...
        convolution2dLayer(40, 5, 'Stride', 2, 'Padding', 'same'), ...
        batchNormalizationLayer, reluLayer, maxPooling2dLayer(2, 'Stride', 2), ...
        convolution2dLayer(60, 5, 'Stride', 2, 'Padding', 'same'), ...
        batchNormalizationLayer, reluLayer, ...
        fullyConnectedLayer(500), fullyConnectedLayer(9), ...
        softmaxLayer, classificationLayer ...
    ];
    
    % Setup the options
    options = trainingOptions(...
       'sgdm', ...
       'MaxEpochs', 40, ...
       'ValidationData', auTest, ... 
       'Verbose', true, ...
       'Plots', 'none' ...
    );

    % Create and train the new CNN
    net = trainNetwork(auTrain, layers, options);
    
    % Test the CNN with the testing set
    guess = classify(net, auTest);
    
    accuracy = sum(guess == test.Labels) / numel(test.Labels);

end

