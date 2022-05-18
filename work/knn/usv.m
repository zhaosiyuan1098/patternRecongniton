function [u,s,v] = usv(norm_fea)
[num_face,~]=size(norm_fea);
temp=(1/num_face)*(norm_fea'*norm_fea); 
[u,s,v]=svd(temp);
end

