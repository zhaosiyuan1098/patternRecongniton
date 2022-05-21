function [u,num_restore_dim] = usv(data,restore_rate)
data=double(data);
[data_length,~]=size(data);
num_restore_dim=0;
sigma=(1/data_length)*(data'*data); 
[u,s,~]=svd(sigma);
s_trace=trace(s);
pca_trace=0;
for i =1:size(s,2)
    pca_trace=pca_trace+s(i,i);
    if pca_trace/s_trace>restore_rate
     num_restore_dim=i; 
     break;
    end
end
end

