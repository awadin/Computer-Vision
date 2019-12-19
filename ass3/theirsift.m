function g = theirsift(image1)

figure;
rgb = image1;
image = single(rgb2gray(rgb));
[keypoints,features] = sift(image,'Levels',4,'PeakThresh',5);
%subplot(1,3,1)
imshow(rgb);hold on;
viscircles(keypoints(1:2,:)',keypoints(3,:)');

figure;
theta = 45;
[keypoints1,features2] = sift(imrotate(image,theta,'crop'),'Levels',4,'PeakThresh',5);
%subplot(1,3,2)
imshow(imrotate(rgb,theta,'crop'));hold on;
viscircles(keypoints1(1:2,:)',keypoints1(3,:)');

figure;
theta = 0;
image = imresize(image, 0.5);
rgb = imresize(rgb, 0.5);
[keypoints1,features2] = sift(image,'Levels',4,'PeakThresh',5);
%subplot(1,3,3)
imshow(rgb);hold on;
viscircles(keypoints1(1:2,:)',keypoints1(3,:)');

%figure;
%showMatchedFeatures(image,imrotate(image,theta,'crop'),features,features2);
end