%{
    project2()
    Created by Ethan Shealey
    =========================================================
    This program creates an net that trains with a set of
    28x28 pixel images. The network is then tested on another
    set of images and the accuracy is returned.

    Parameters:
        None

    Returns:
        accuracy: The accuracy of the network on the test set
%}

function accuracy = project2()
    
    % Load the training and test data
    training_set = loadMNISTImages('training_set');
    training_labels = loadMNISTLabels('training_label');
    testing_set = loadMNISTImages('test_set');
    testing_labels = loadMNISTLabels('test_label');
    
    % Reshape the training data sets
    training_labels = reshape(training_labels, [], numel(training_labels));
    testing_labels = reshape(testing_labels, [], numel(testing_labels));
    
    % Get the column size of training labels
    [~, tc] = size(training_labels);

    % Prepare a matrix of 10 x tc
    tt = zeros(10, tc);
    
    % Setup correct indicies 
    for c = 1:tc
        r = training_labels(1,c) + 1;
        tt(r, c) = 1;
    end
    
    % Create and train the network
    disp('Training...')
    net = patternnet([100 100]);
    net = train(net, training_set, tt);
    
    % Test the network
    disp('Testing...')
    output = net(testing_set);
    
    % Get the size of the output and create a matrix to hold guesses
    [~,m] = size(output);
    guess = zeros([1,m]);
    
    % Get the most-likely guess from each column
    for c = 1:m
        [~, row] = max( output(:,c) );
        guess(1,c) = row-1;
    end
    
    % Calculate the accuracy of the network
    accuracy = sum(guess == testing_labels) / numel(testing_labels);

end