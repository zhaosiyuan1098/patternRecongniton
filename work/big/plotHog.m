load('.\cifar-10-batches-mat\data_batch_1.mat')
data_3dim=reshape(data,[length(data),size(data,2)/3,3]);
dataGray=rgb2gray(data_3dim);
image_size=sqrt(size(dataGray,2));
image=reshape(dataGray(41,:),[image_size,image_size]);
origin_image=reshape(data_3dim(141,:,:),[image_size,image_size,3]);
[featureVector,hogVisualization] = extractHOGFeatures(image);
figure;
imshow(origin_image); 
hold on;
plot(hogVisualization);