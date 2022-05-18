function [train_fea,train_gnd,test_fea,test_gnd] = divideTrainTest(fea,gnd,test_rate)
[num_face, ~] = size(fea);        %ndata样本数，D维数
num_test=round(num_face*test_rate);
R = randperm(num_face);         %1到n这些数随机打乱得到的一个随机数字序列作为索引
test_fea = fea(R(1:num_test),:);  %以索引的前1000个数据点作为测试样本Xtest
test_gnd=gnd(R(1:num_test),:);
R(1:num_test) = [];

train_fea = fea(R,:);          %剩下的数据作为训练样本Xtraining
train_gnd = gnd(R,:); 
end

