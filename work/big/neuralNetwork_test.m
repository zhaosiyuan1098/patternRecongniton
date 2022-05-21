function [net,accuracy] = neuralNetwork_test(pca_train_data,train_label,pca_test_data,test_label)
%NEURALNETWORK Summary of this function goes here
%   Detailed explanation goes here
num_class=length(unique(train_label));
num_feature=size(pca_train_data,2);
sequence_size=sqrt(num_feature);
filterSize = 3;
numFilters = 20;
numHiddenUnits = 200;
numClasses = 10;

layers = [ ...
    sequenceInputLayer(num_feature,'Name','input')

    sequenceFoldingLayer('Name','fold')

    convolution2dLayer(filterSize,9,'Name','conv')
    batchNormalizationLayer('Name','bn')
    reluLayer('Name','relu')

    sequenceUnfoldingLayer('Name','unfold')
    flattenLayer('Name','flatten')

    lstmLayer(numHiddenUnits,'OutputMode','last','Name','lstm')

    fullyConnectedLayer(numClasses, 'Name','fc')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classification')];

lgraph = layerGraph(layers);
lgraph = connectLayers(lgraph,'fold/miniBatchSize','unfold/miniBatchSize');

options = trainingOptions(...
    'sgdm', ...
    'MaxEpochs', 200, ...
    'Plots','training-progress', ...
    'InitialLearnRate',0.01, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropPeriod',50, ...
    'LearnRateDropFactor',0.1);
net = trainNetwork(pca_train_data',categorical(train_label'),lgraph,options);
test_predict = classify(net,pca_test_data');
test_predict = grp2idx(test_predict);

% Check accuracy of predicted values and display confusion matrix
accuracy = mean(test_predict==test_label+1) * 100;
% disp("Accuracy: " + accuracy + "%");
% plotconfusion(ind2vec(test_label),ind2vec(test_predict),'Neural Network');
end

