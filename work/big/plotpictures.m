%% Visualise each class individually
% This part individually highlights each class withing the feature space

labelNames = ["飞机","automobile","bird","猫","deer", ...
              "狗","frog","horse","ship","truck"];

for class = 1 : 10
    figure;
    color = [];
    markersymbol = [];
    markersize = [1.8];
    drawLegend = [];
    diagStyle = [];
    featureLabels = {'D1'; 'D2'; 'D3'; 'D4'; 'D5'};
    gplotmatrix(pca_train_data(:,1:5),pca_train_data(:,1:5),train_label==class,color,markersymbol,markersize,drawLegend,diagStyle,featureLabels,featureLabels);
    title("五维散布矩阵: " + labelNames(class));
end

%% Visualise each class individually in 3D
labelNames = ["airplane","automobile","鸟","cat","deer", ...
              "dog","frog","马","ship","truck"];

for class = 1 : 10
    figure;
    scatter3(pca_train_data(1:1000,1),pca_train_data(1:1000,2),pca_train_data(1:1000,3),15,train_label(1:1000)==class,'.')
    title("PCA空间下的三维分布: " + labelNames(class));
end


%% Explore class separability using Probability Density Function (PDF)
col = hsv(10);
for dimension = 5 : 6
    figure;
    hold on;
    for class = 1 : 10
        logIdx = train_label == class;
        data = pca_train_data(logIdx,dimension);
        if(size(data)>0)
        h = histfit(data,5,'kernel');
        h(1).EdgeAlpha = 0;
        h(1).FaceColor = 'none';
        h(2).Color = col(class,:);
        end
    end
    title("可分离性-维数: " + dimension);
end


%% Explore class separability of the unreduced data
% This section visualises some of the 324 unreduced features to see if we 
% can handpick dimensions with good class separability for classification

% Load raw 324 computed features and class labels
load('CW2Data.mat','trn_features','tst_features','trnLabel','tstLabel');

% Loops through dimensions of unreduced 324 features, change loop
% iterations '40 : 60' to explore other features

for dimension = 40 : 60
    color = colorcube(10);
    figure
    gscatter(trn_features(:,[dimension]),trn_features(:,[dimension+1]),trnLabel,color,'.',5);
    title("Dimensions " + dimension + " vs " + (dimension+1));
end
%% 
figure

x1 = ones(1, 7);
x2 = 2 * ones(1, 10);
x3 = 3 * ones(1, 10);
y1 = 2:8; %保证在最长蓝色结点的中间位置，上下各数2个结点
y2 = 1:10;
y3 = 1:10;
for i = 1:7
    for j = 1:10
        plot([x1(i), x2(j)], [y1(i), y2(j)], 'k');%k表示黑色
        hold on
    end
end

for i = 1:10
    for j = 1:10
        plot([x2(i), x3(j)], [y2(i), y3(j)], 'k');
        hold on
    end
end


scatter(x1, y1, 200, 'k', 'MarkerEdgeColor', 'g');
scatter(x2, y2, 200, 'k', 'MarkerEdgeColor', 'b');
scatter(x3, y3, 200, 'k', 'MarkerEdgeColor', 'r');
plot([1.5, 1.5], [0, 11], 'k--');
plot([2.5, 2.5], [0, 11], 'k--');
hold off
axis off