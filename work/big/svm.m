function [svm_model,svm_accuracy] = svm(pca_train_data,train_label,pca_test_data,test_label)
t = templateSVM('SaveSupportVectors',true, 'Standardize', true, 'KernelFunction','gaussian', ...
     'KernelScale', 'auto','Verbose', 0);
% t = templateSVM('SaveSupportVectors',true, 'Standardize', true, 'KernelFunction','polynomial', ...
%     'KernelScale', 'auto','Verbose', 0);
svm_model = fitcecoc(pca_train_data,train_label,'Learners',t);

test_predict = predict(svm_model,pca_test_data);

svm_accuracy = mean(test_predict==test_label) ;
test_label=double(test_label);
test_predict=double(test_predict);
plotconfusion(ind2vec(test_label'+1),ind2vec(test_predict'+1),'SVM混淆矩阵');
end