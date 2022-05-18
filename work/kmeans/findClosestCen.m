function index = findClosestCen(fea,centroids,dis_tag)
[num_face,~]=size(fea);
index=zeros(num_face,1);
num_person=size(centroids,1);
for i = 1:num_face
    min_dist=999999999999999;
    for j =1:num_person
        switch dis_tag
            case 'eu'
        dist = sqrt(sum((fea(i,:)- centroids(j,:)).^2));
            case 'l1'
        dist = sqrt(sum((fea(i,:)- centroids(j,:)).^2));
            case 'mk'
        dist = sqrt(sum((fea(i,:)- centroids(j,:)).^2));        
        end
        if dist < min_dist
            min_dist = dist;
            index(i) = j;
        end
    end
end

