function [net,accuracy] = neuralNetwork(pca_train_data,train_label,pca_test_data,test_label)
%NEURALNETWORK Summary of this function goes here
%   Detailed explanation goes here
num_class=length(unique(train_label));
num_feature=size(pca_train_data,2);
layers = [
    sequenceInputLayer(num_feature)  
    fullyConnectedLayer(num_class)
    softmaxLayer
    classificationLayer];

% Choose SGDM solver, 160 epochs, dynamically shrinking learning rate
options = trainingOptions(...
    'sgdm', ...
    'MaxEpochs', 200, ...
    'Plots','training-progress', ...
    'InitialLearnRate',0.01, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropPeriod',50, ...
    'LearnRateDropFactor',0.1);

% Train our NN and use it to predict testing data
net = trainNetwork(pca_train_data',categorical(train_label'),layers,options);
test_predict = classify(net,pca_test_data');
test_predict = grp2idx(test_predict)';

% Check accuracy of predicted values and display confusion matrix
accuracy = mean(test_predict'==test_label+1);
end