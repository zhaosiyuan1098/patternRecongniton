num_class=10;
c_matrix=zeros(num_class);
c_matrix(:,:)=0.001;
for i=1:num_class
    c_matrix(i,i)=0;
end