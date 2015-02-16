function svm = colour_train( img_cell , gt_training )
% Returns SVM binary classifier for deciding if image is a red suit or a black suit
% img_cell: cell array of all training images
% gt_training: 2D, each row describes image, suit 1st element, value 2nd

[N, ~] = size(gt_training);

y = zeros(N,1);
X = zeros(N,101);

for i = 1 : N
    
    % Make y (class labels)
    suit = gt_training(i,1);
    y(i) = mod(suit,2);
    
    % Make X (feature vectors) - histogram of hue values, 100 bins
    img = img_cell{i};
    hsv = rgb2hsv(img);
    hue = hsv(:,:,1);
    [H,W] = size(hue);
    M = H*W;
    
    for j = 1 : M
        
        h = hue(j);
        x = str2double(sprintf('%.2f',h));
        k = x*100 + 1;
        k = int8(k);
        X(i,k) = X(i,k) + 1;
end

svm = fitcsvm(X,y);
    
end