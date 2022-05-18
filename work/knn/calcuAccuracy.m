function accuracy = calcuAccuracy(index,train_gnd,test_gnd)
wrong = 0;
correct = 0;
for i = 1:length(index)
    % find the most frequent one in the array
    
%     guessed_class = mode(ceil(train_gnd(i,:) /11));
    guessed_class=mode(train_gnd(index(i,:)));
    if (guessed_class == test_gnd(i, 1))
        correct = correct + 1;
    else
        wrong = wrong + 1;
    end
end

accuracy = correct / (correct + wrong);
end

