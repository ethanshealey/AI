%{
    hw5.m
    Created by Ethan Shealey
    ----------------------------------------------------
    The purpose of this program is to create a 
    simple feedfoward neural network that takes in
%}
%{
function SSE = hw5(in, t)
    inputs = load(in);
    targets = load(t);

    inputsLength = length(inputs.bodyfatInputs);
    targetsLength = length(targets.bodyfatTargets);

    randomSplit = randi(inputsLength);

    trainInputs = inputs.bodyfatInputs(:, 1:randomSplit);
    trainTargets = targets.bodyfatTargets(:, 1:randomSplit);

    testInputs = inputs.bodyfatInputs(:, randomSplit+1:end);
    testTargets = targets.bodyfatTargets(:, randomSplit+1:end);

    net = feedforwardnet(2);
    disp('Training...')
    net = train(net, trainInputs, trainTargets);

    out = net(double(testInputs));

    disp('Testing...')
    SSE = perform(net, testTargets, out);
end
%}

function avgSSE = hw5()
    clc
    close all
    clear

    load('bodyfat_dataset.mat');
    trainFcn = 'trainlm';
    net = feedforwardnet([100,100], trainFcn);

    x = bodyfatInputs
    y = bodyfatTargets

    [net,tr] = train(net,x,y);
    id = 80

    test_data = x(:,id);
    test_target = y(:,id);

    guess = net(test_data);

    SSE = perform(net, test_target, guess);

    avgSSE = SSE/length(test_target);

end