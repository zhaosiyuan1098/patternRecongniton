clear;
%% 数据读取与预处理
%test_rate代指测试集占整体数据集比例
%featureData为归一化后的原始图片hog+hsv特征

load('.\cifar-10-batches-mat\data_batch_1.mat')

test_rate=0.1;
featureData=featureExtra(data);
[train_data,train_label,test_data,test_label]=divideTrainTest(featureData,labels,test_rate);
%% pca降维处理
%pca_store_rate为pca保留特征占总特征的比例

pca_restore_rate=0.95;
[pca_u,restore_dim] = usv(train_data,pca_restore_rate);
pca_train_data= project(train_data,pca_u,restore_dim);
pca_test_data= project(test_data,pca_u,restore_dim);
%% 神经网络分类
%net为训练后网络，nn_accuracy为神经网络测试集正确率

[net,nn_accuracy] = neuralNetwork(pca_train_data,train_label,pca_test_data,test_label);

%% svm分类
%svm_model为训练后模型，svm_accuracy为支持向量机测试正确率

[svm_model,svm_accuracy] = svm(pca_train_data,train_label,pca_test_data,test_label);

%% knn分类
%knn_accuracy为最近邻算法分类正确率

knn_accuracy = knn(pca_train_data,train_label,pca_test_data,test_label,7);
