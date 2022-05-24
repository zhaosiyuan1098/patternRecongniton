function [u,num_restore_dim,remain_rate] = usv(data,restore_rate)
%此函数用于对矩阵进行奇异值分解，并确定降维维数以保留部分特征
%restore_rate为特征保有率
%restore_dim为确定维数
data=double(data);
[data_length,~]=size(data);
num_restore_dim=0;
sigma=(1/data_length)*(data'*data); %变换成可分解的形式
[u,s,~]=svd(sigma);
s_trace=trace(s);
pca_trace=0;
remain_rate=ones(1,size(s,2));
%计算矩阵的迹
for i =1:size(s,2)
    pca_trace=pca_trace+s(i,i);
    remain_rate(1,i)=pca_trace/s_trace;
    if pca_trace/s_trace>restore_rate
     num_restore_dim=i; 
     break;
    end
end
end

