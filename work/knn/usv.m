function [u,num_eigen] = usv(norm_fea,restore_rate)
[num_face,~]=size(norm_fea);
num_eigen=0;
sigma=(1/num_face)*(norm_fea'*norm_fea); 
[u,s,~]=svd(sigma);
s_trace=trace(s);
pca_trace=0;
for i =1:size(s,2)
    pca_trace=pca_trace+s(i,i);
    if pca_trace/s_trace>restore_rate
     num_eigen=i; 
     break;
    end
end
end

