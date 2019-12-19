%This is my RANSAC algorithm for picking the correct homog. It is outlined
%in my report.

function [winner, coords, coords2] = RANSAC(im2, im1, rgb2, rgb1)

%Create sift comparisons between successive images with given sift
%implementation
%Duplicate from main implementation
image1 = single(im1);
[keypoints1,features1] = sift(image1,'Levels',4,'PeakThresh',5);

image2 = single(im2);
[keypoints2,features2] = sift(image2,'Levels',4,'PeakThresh',5);
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

%Generate the homographies
conSet = cell(1, 3);
winner = cell(10,3);
%Cell 1 = homo
% cell 2 = x,y and x',y'
% cell 3 = solutions of consensus set at that iteration (distances)

%Apply ransac 100 different times
for q = 1 : 100

    %Pick 4 random matching points 
    % Random points
    [sift11, sift12, sift21, sift22] = randomIndex(length(indexPairs));
    %Get these points (x,y)'s and their matching (x,y)'s to make 4 4-tuples

    point1 = [keypoints1(1, indexPairs(sift11, 1)), keypoints1(2, indexPairs(sift11, 1))];
    point2 = [keypoints1(1,  indexPairs(sift12, 1)), keypoints1(2, indexPairs(sift12, 1))];
    point3 = [keypoints1(1,  indexPairs(sift21, 1)), keypoints1(2, indexPairs(sift21, 1))];
    point4 = [keypoints1(1,  indexPairs(sift22, 1)), keypoints1(2, indexPairs(sift22, 1))];

    %Corrsponding keypoints in other image

    corres1 = [keypoints2(1, indexPairs(sift11, 2)), keypoints2(2, indexPairs(sift11, 2))];
    corres2 = [keypoints2(1,  indexPairs(sift12, 2)), keypoints2(2, indexPairs(sift12, 2))];
    corres3 = [keypoints2(1,  indexPairs(sift21, 2)), keypoints2(2, indexPairs(sift21, 2))];
    corres4 = [keypoints2(1,  indexPairs(sift22, 2)), keypoints2(2, indexPairs(sift22, 2))];

    % Generate homography from these random points
    h = buildHomog(point1, point2, point3, point4, corres1, corres2, corres3, corres4);
    %Get H matrix! (3x3 but this returns a single vector of 9)
    nullSpace = null(h);
    nullSpace = nullSpace(:,1);
    homo = reshape(nullSpace, [3,3]);
    homo = transpose(homo);

    index = 1;
    %Find consensus set
    for i = 1: length(indexPairs)
        currpoint = [keypoints1(1, indexPairs(i, 1)), keypoints1(2, indexPairs(i, 1)), 1];
        wvector = currpoint*homo;
        for j = 1 : 3
            wvector(j) = wvector(j)/wvector(3);
        end
        X = [wvector(1), wvector(2)];
        X2 = [keypoints2(1, indexPairs(i, 2)), keypoints2(2, indexPairs(i, 2))];
        %Distance equation from lecture 20
        dist = sqrt(norm(X - X2));
        if(dist < 23)
            conSet{index, 1} = homo;
            conSet{index, 2} = currpoint;
            conSet{index,3} = X2;
            index = index + 1;
        end
    end
    %If our newly found set is the best set, take it
    if(length(conSet) > length(winner))
        winner = conSet;
    end
end

%This is done just to display the images correctly
coords = double(zeros(length(winner), 2));
coords2 = double(zeros(length(winner), 2));

for i = 1 : length(winner)
    coords(i, 1) = winner{i,2}(1);
    coords(i, 2) = winner{i,2}(2);
    coords2(i, 1) = winner{i,3}(1);
    coords2(i,2) = winner{i,3}(2);
end

figure;
showMatchedFeatures(rgb1,rgb2,coords,coords2, 'montage');


end