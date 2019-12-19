function sift = computeSift()
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

    % Question 7
    % Display images
    %comparePoints = question7(gray, rotate(gray, 300,400, 45, 1));
    %figure;
    %imshow(comparePoints);
end
