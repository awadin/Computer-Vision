%AIDAN WADIN - 260716182
%Import images
rgb1 = imread('1.png');
im1 = rgb2gray(rgb1);
rgb2 = imread('2.png');
im2 = rgb2gray(rgb2);
rgb3 = imread('3.png');
im3 = rgb2gray(rgb3);
rgb4 = imread('4.png');
im4 = rgb2gray(rgb4);
rgb5 = imread('5.png');
im5 = rgb2gray(rgb5);

%%
%Question 1

%Here are examples of my own sift implementation
%Please note the resizing of the given images, this is due to my sift
%implementation only working when the matrix dimensions match. I was
% advised by the TA's to do this. 
%Uncomment below to execute number 1

im = imresize(im1, [1024 1024]);
mysift1 = computeSift(im);

 imm = rotate(im, 300, 400, 45, 1);
mysift2 = computeSift(imm);

immm = rotate(im, 512, 512, 0, 0.5);
mysift3 = computeSift(immm);

%Here are the same images using the given sift implementation

theirsift(rgb1);


%%
%Question 2

%Resize image so that my sift code can work on it
im = imresize(im1, [1024 1024]);
imm = rotate(im, 300, 400, 45, 1);
immm = rotate(im, 512, 512, 0, 0.5);



%Show matched features between successive images using MY sift
%implementation

%Image 1 sift
array = gaussPyrBuild(im);
figure;
DOG = DOGPyrBuild(array);
points = question3(DOG, gray);
[patches, dirs, gmagw] = question4(array, points);
sift1 = question5(patches, dirs, gmagw, points);

%image2 sift
array = gaussPyrBuild(imm);
figure;
DOG = DOGPyrBuild(array);
points = question3(DOG, gray);
[patches, dirs, gmagw] = question4(array, points);
sift2 = question5(patches, dirs, gmagw, points);

%Match features between MY sift features
indexPairs = matchFeatures(sift1,sift2);

coordinates1 = double(zeros(length(indexPairs), 2));
coordinates2 = double(zeros(length(indexPairs), 2));

for i = 1 : length(indexPairs)
        coordinates1(i,1) = sift1(indexPairs(i,1), 1);
        coordinates1(i, 2) = sift1(indexPairs(i,1), 2);
        %COMMENT IN WHY LATER
        coordinates2(i,1) = sift2(indexPairs(i,2), 1) + length(im)/4;
        coordinates2(i, 2) = sift2(indexPairs(i,2), 2);
end

figure;
showMatchedFeatures(rgb1,rgb2,coordinates1,coordinates2, 'montage');

%Create sift comparisons between successive images with given sift
%implementation
figure;
image1 = single(im1);
[keypoints1,features1] = sift(image1,'Levels',4,'PeakThresh',5);
subplot(1,2,1)
imshow(rgb1);hold on;
viscircles(keypoints1(1:2,:)',keypoints1(3,:)');

image2 = single(im2);
[keypoints2,features2] = sift(image2,'Levels',4,'PeakThresh',5);
subplot(1,2,2)
imshow(rgb2);hold on;
viscircles(keypoints2(1:2,:)',keypoints2(3,:)');

indexPairs = matchFeatures(transpose(features1),transpose(features2));
%use these 2 to get the proper lengths for the coordinates1&2
matchedPoints1 = double(features1(indexPairs(:, 1)));
matchedPoints2 = double(features2(indexPairs(:, 2)));
coordinates1 = double(zeros(length(matchedPoints1), 2));
coordinates2 = double(zeros(length(matchedPoints2), 2));

for i = 1 : length(matchedPoints1)
        coordinates1(i,1) = keypoints1(1,indexPairs(i, 1));
        coordinates1(i, 2) = keypoints1(2, indexPairs(i,1));
        coordinates2(i,1) = keypoints2(1,indexPairs(i,2));
        coordinates2(i, 2) = keypoints2(2, indexPairs(i,2));
end

figure;
showMatchedFeatures(rgb1,rgb2,coordinates1,coordinates2, 'montage');



%%
%Question 3
%Winner holds the best homography and the coordinates are the preserved
%coordinates between the two images (the matching features kept)
[winner1, coords11, coords12] = RANSAC(im1, im2, rgb1, rgb2);
[winner2, coords21, coords22] = RANSAC(im2, im3, rgb2, rgb3);
[winner3, coords31, coords32] = RANSAC(im3, im4, rgb3, rgb4);
[winner4, coords41, coords42] = RANSAC(im4, im5, rgb4, rgb5);


%%
% %Question 4
%
outputpano = panoramic(winner1{1,1}, im2, im1);
outputpano2 = panoramic(winner2{1,1}, im3, im2);
outputpano3 = panoramic(winner3{1,1}, im4, im3);
outputpano4 = panoramic(winner4{1,1}, im5, im4);

threepano = panoramicM(outputpano, winner1{1,1}, winner2{1,1}, im3);
%This was not included in the report as it doesn't really show anything
fourpano = panoramicM(threepano, winner1{1,1}*winner2{1,1}, winner3{1,1}, im4);

%%
% %Question 5

%Import my images
rgba = imread('mine1.jpg');
ima = rgb2gray(imrotate(rgba, 270));
ima = imresize(ima, [1000, 750]);
rgbb = imread('mine2.jpg');
imb = rgb2gray(imrotate(rgbb, 270));
imb = imresize(imb, [1000, 750]);
rgbc = imread('mine3.jpg');
imc = rgb2gray(imrotate(rgbc, 270));
imc = imresize(imc, [1000, 750]);
rgbd = imread('mine4.jpg');
imd = rgb2gray(imrotate(rgbd, 270));
imd = imresize(imd, [1000, 750]);

[winnera, coords11, coords12] = RANSAC(ima, imb, ima, imb);
[winnerb, coords21, coords22] = RANSAC(imb, imc, imb, imc);
[winnerc, coords31, coords32] = RANSAC(imc, imd, imc, imd);

outputpano1 = panoramic(winnera{1,1}, imb, ima);
outputpano2a = panoramic(winnerb{1,1}, imc, imb);

threepano2 = panoramicM(outputpano1, winnera{1,1}, winnerb{1,1}, imc);

%%
%Question 6 - In report :)

