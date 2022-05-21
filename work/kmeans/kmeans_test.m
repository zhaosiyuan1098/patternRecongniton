clear;
clc;

load('Yale_32x32.mat')
 fea=imsubtract(fea,80);
[num_face,num_dim]=size(fea);
% num_person=input("how many people in these faces?");
num_person=15;
centroids=initCentroid(fea,num_person);
max_iter=10;
dis_flag='eu';
for i=1:max_iter
index=findClosestCen(fea,centroids,dis_flag);
[rate,centroids]=changeCen(fea,index,centroids,num_person);
histogram(index)
end
% figure;
% displayData(fea(1:165,:));
figure;
displayData(centroids(1:15,:));
 rate