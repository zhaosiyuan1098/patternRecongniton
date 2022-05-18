function lower_fea= project(fea,u,dim)
[num_face,~]=size(fea);
lower_fea=zeros(num_face,dim);
u_reduce = u(:,1:dim);   % n x K
lower_fea = fea* u_reduce; 
end

