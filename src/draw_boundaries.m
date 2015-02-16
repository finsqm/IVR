img_cell = load_train();
test = load_test()
N = size(img_cell);
crops = cell(N);
for i = 1 : N
    I = img_cell{i};
    BW = edge(rgb2gray(I), 'canny');
    BW2 = bwareaopen(BW, 700);
    BW3 = imfill(BW2, 'holes');
    [B,L] = bwboundaries(BW2,'noholes');
    % Display the label matrix and draw each boundary
    %figure; imshow(I)
    %hold on
    boundary = B{1};
    %plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 5)
    [ height_min, height_max, width_min, width_max ] = corners( boundary );

    crop = I(height_min:height_max, width_min:width_max, :);
    hsv = rgb2hsv(crop);
    crops{i} = crop;
    %figure; imshow(sat)
end

svm = colour_train( crops , gt_training );
label = classify_colour( svm, test )