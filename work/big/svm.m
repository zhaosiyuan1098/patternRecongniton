function [svm_model,svm_accuracy] = svm(pca_train_data,train_label,pca_test_data,test_label)
t = templateSVM('SaveSupportVectors',true, 'Standardize', true, 'KernelFunction','polynomial', ...
    'KernelScale', 'auto','Verbose', 1);
svm_model = fitcecoc(pca_train_data,train_label,'Learners',t);
% tempSVM = templateSVM('KernelFunction','polynomial','PolynomialOrder',5,'KernelFunction','gaussian');
% 
% Mdl = fitcecoc(pca_train_data,train_label,'Learners',tempSVM);
% 
% % Test the multiclass SVM model on the testing data
y_tst_predict = predict(svm_model,pca_test_data);

% Check accuracy of predicted values and display confusion matrix
svm_accuracy = mean(y_tst_predict==test_label) ;
% disp("Accuracy with PCA reduced data: " + svm_accuracy + "%");
% plotconfusion(ind2vec(tstLabel'),ind2vec(y_tst_predict'),'SVM on PCA reduced data');
end