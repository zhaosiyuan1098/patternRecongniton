clear;
clc;
num_eigen=70;
test_rate=0.1;
knn_k=3;
load('Yale_64x64.mat')
[train_fea,train_gnd,test_fea,test_gnd]=divideTrainTest(fea,gnd,test_rate);
[num_train_person,dim]=size(train_fea);
norm_fea=normalize(train_fea);
[u,s,v]=usv(norm_fea);
lower_train_fea=project(train_fea,u,num_eigen);
lower_test_fea=project(test_fea,u,num_eigen);
index=knnsearch(lower_train_fea,lower_test_fea,'k', knn_k, 'Distance', 'cityblock');
accu=calcuAccuracy(index,train_gnd,test_gnd)
% figure;
% displayData(train_fea(1:num_train_person,:));
% figure;
% displayData(norm_fea(1:num_train_person,:));
%  figure;
%  displayData(u(:, 1:200)');


