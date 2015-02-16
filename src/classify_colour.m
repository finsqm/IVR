function  label = classify_colour( svm, test )
% Given a trained svm this function classifies test images into suit colours
% BLACK = 1
% RED = 0
% svm: trained SVM
% test: cell array of test images

[N, ~] = size(test);
X = zeros(N, 101);

for i = 1 : N
    
    % Make X (feature vectors) - histogram of hue values, 100 bins
    img = test{i};
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

[label,~] = predict(svm,X);



end

