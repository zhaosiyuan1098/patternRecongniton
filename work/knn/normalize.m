function norm_fea = normalize(fea)
mean_face=mean(fea);
norm_fea=bsxfun(@minus, fea, mean_face);

sigma = std(norm_fea);
norm_fea = bsxfun(@rdivide, norm_fea, sigma);
end

