rgb = imread('1.png');
image = single(rgb2gray(rgb));
[keypoints,features] = sift(image,'Levels',4,'PeakThresh',5);
subplot(1,2,1)
imshow(rgb);hold on;
viscircles(keypoints(1:2,:)',keypoints(3,:)');

theta = 45;
[keypoints1,~] = sift(imrotate(image,theta,'crop'),'Levels',4,'PeakThresh',5);
subplot(1,2,2)
imshow(imrotate(rgb,theta,'crop'));hold on;
viscircles(keypoints1(1:2,:)',keypoints1(3,:)');

[features1,valid_points1] = extractFeatures(image,transpose(keypoints(1:2, :)));
[features2,valid_points2] = extractFeatures(imrotate(image,theta,'crop'),transpose(keypoints(1:2, :)));

indexPairs = matchFeatures(features1, features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

figure;
showMatchedFeatures(image,imrotate(image,theta,'crop'),matchedPoints1,matchedPoints2);
