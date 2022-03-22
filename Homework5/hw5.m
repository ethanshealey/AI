%{
    hw5.m
    Created by Ethan Shealey
    ----------------------------------------------------
    The purpose of this program is to create a 
    simple feedfoward neural network that takes in
%}


function avgSSE = hw5()

    clc
    close all
    clear

    % Load in the bodyfat data
    load('bodyfat_dataset.mat');

    % Set the training function as trainlm
    trainFcn = 'trainlm';

    % Create the feedfoward neural network
    net = feedforwardnet([100,100], trainFcn);

    % Pull the inputs and targets from dataset
    x = bodyfatInputs
    y = bodyfatTargets

    % Train the nueral network
    [net,tr] = train(net,x,y);
    id = 80

    % Pull the test data from dataset
    test_data = x(:,id);
    test_target = y(:,id);

    % Test the neural network
    guess = net(test_data);

    % Calculate the error
    SSE = perform(net, test_target, guess);

    % Calculate the average error
    avgSSE = SSE/length(test_target);

end