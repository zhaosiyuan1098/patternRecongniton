function [knn_accuracy] = knn(pca_train_data,train_label,pca_test_data,test_label,k)
index=knnsearch(pca_train_data,pca_test_data,'k', k, 'Distance', 'cityblock');
wrong = 0;
correct = 0;
for i = 1:length(index)
    % find the most frequent one in the array
    
%     guessed_class = mode(ceil(train_gnd(i,:) /11));
    guessed_class=mode(train_label(index(i,:)));
    if (guessed_class == test_label(i, 1))
        correct = correct + 1;
    else
        wrong = wrong + 1;
    end
end

knn_accuracy = correct / (correct + wrong);
end

