function [featureData] = featureExtra(data)

data_3dim=reshape(data,[length(data),size(data,2)/3,3]);

dataHsv=rgb2gray(data_3dim);
dataGray=rgb2gray(data_3dim);
dataHsv=double(dataHsv);
dataGray=double(dataGray);

dataGray_size=length(dataGray);
image_size=sqrt(size(dataGray,2));
image=reshape(dataGray(1,:),[image_size,image_size]);
hogVector = extractHOGFeatures(image);
featureDataTemp=zeros(length(data),size(hogVector,2)+size(dataHsv,2));
for i =1:dataGray_size
    image=reshape(dataGray(i,:),[image_size,image_size]);
    hogVector = extractHOGFeatures(image);
    hogVector=double(hogVector);
    featureDataTemp(i,:)=[hogVector,dataHsv(i,:)];
end
featureData=mapminmax(featureDataTemp',0,1)';
end

