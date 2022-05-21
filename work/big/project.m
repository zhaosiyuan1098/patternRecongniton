function pcaData= project(data,u,dim)
[num_face,~]=size(data);
pcaData=zeros(num_face,dim);
u_reduce = u(:,1:dim);   % n x K
pcaData = data* u_reduce; 
end

