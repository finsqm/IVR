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
    
    
end

[label,~] = predict(svm,X);



end

