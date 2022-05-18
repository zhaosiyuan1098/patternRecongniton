function [correct_rate,centroids] = changeCen(fea,index,centroids,num_person)
 [num_face,num_pixel]=size(fea);
num_incorrect=0;
    for i =1:num_person
        face_i=find(index==i);
        num_incorrect=num_incorrect+abs(num_person-size(face_i,1));
        centroids(i,:) = mean(fea(face_i,:));
    end
    correct_rate=(num_face-num_incorrect)/num_face;
end

