function centroids = initCentroid(fea,num_person)
% centroids=zeros(num_person,size(fea,2));
% for i=1:num_person
% %     1+(i-1)*size(fea,1)/num_person
%      centroids(i,:)=fea(10+(i-1)*size(fea,1)/num_person,:);
% end
randidx = randperm(size(fea, 1));
centroids = fea(randidx(1:num_person), :);
end

