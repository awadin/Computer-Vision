% COMP 558 - Assignment 2 - Aidan Wadin

% Import images
I = imread('manor.png');
gray = rgb2gray(I);
imshow(gray);
figure;

%Question 1
array = gaussPyrBuild(gray);
figure;

%Question 2
DOG = DOGPyrBuild(array);

%Question 3
points = question3(DOG, gray);

% Question 4
[patches, dirs, gmagw] = question4(array, points);

% Question 5
sift = question5(patches, dirs, gmagw, points);

% Question 6
figure;
imshow(rotate(gray, 300,400, 45, 1));
figure;
imshow(rotate(gray, 200,200, 90, 0.5));

% Question 7
% Display images
comparePoints = question7(gray, rotate(gray, 300,400, 45, 1));
figure;
imshow(comparePoints);

% Rotated image - sift generation for roated image 1
array2 = gaussPyrBuild(rotate(gray, 300,400, 45, 1));
DOG2= DOGPyrBuild(array2);
points2 = question3(DOG2, rotate(gray, 300,400, 45, 1));
[patches2, dirs2, gmagw2] = question4(array2, points2);
sift2 = question5(patches2, dirs2, gmagw2, points2);

%Rotated and scaled image for image 2
array3 = gaussPyrBuild(rotate(gray, 200,200, 90, 0.5));
DOG3= DOGPyrBuild(array3);
points3 = question3(DOG3, rotate(gray, 200,200, 90, 0.5));
[patches3, dirs3, gmagw3] = question4(array3, points3);
sift3 = question5(patches3, dirs3, gmagw3, points3);

figure;
imshow(comparePoints);

matchPoints(gray, rotate(gray, 300,400, 45, 1), sift, sift2, 200, 200);
matchPoints(gray, rotate(gray, 200,200, 90, 0.5), sift, sift3, 200, 200);


