%Read in all images and convert them to single greyscale channels
image1 = imread('Paolina.jpg');
image2 = imread('mount2.jpg');
image1 = rgb2gray(image1);
image2 = rgb2gray(image2);

%LOG #3 A
%Make a bunch of LOG altering the size of N and see the differences in
%output
index = 1;  
for j = 5: 5 : 50
    if mod(j, 2) == 0
        j = j+1;
    end
    log = make2DLOG(j, 2);
    logOut = conv2(image1, log, 'same');
    subplot(2,5,index);
    imshow(logOut);
    title("LOG Changing N = " + j + ", sigma = 2");
    index = index + 1;
end

%Make a bunch of LOG altering the size of sigma and see the differences in
%output
figure;
index = 1;
for i = 0 : 5
    log = make2DLOG(21, i);
    logOut = conv2(image1, log, 'same');
    subplot(1,6,index);
    imshow(logOut);
    title("LOG SIGMA N = 21" + ", sigma = " + i);
    index = index + 1;
end

%Show off what I think will be the best LOG given my data collection
figure;
log = make2DLOG(21, 2);
logOut = conv2(image2, log, 'same');
imshow(logOut);
title("Best LOG?");

figure;
log = make2DLOG(21, 2);
logOut = conv2(image1, log, 'same');
imshow(logOut);
title("Best LOG? - image 1");

%Show zeros crossings for the "best log" image
figure;
log = make2DLOG(21, 2);
logOut = conv2(image1, log, 'same');
imshow(zeroCrossings(logOut));
title("LOG zero crossings sigma 2");

%Show zero crossings for "best log" on image 2
figure;
log = make2DLOG(21, 2);
logOut = conv2(image2, log, 'same');
imshow(zeroCrossings(logOut));
title("LOG zero crossings sigma 2");

%Show zero crossings with a different sigma in the LOG to see what would 
%occur
figure;
log = make2DLOG(21, 3);
logOut = conv2(image1, log, 'same');
zeros = zeroCrossings(logOut);
imshow(zeros);
title("LOG zero crossings sigma 3");

% Show off overlay image of zero crossings over the original
figure;
reversey = reverseCross(zeros);
overlay = labeloverlay(image1, reversey);
imshow(overlay);
title("Overlay");

%Show off zero crossings with LOG having sigma 3 for image 2
figure;
log = make2DLOG(21, 3);
logOut = conv2(image2, log, 'same');
zeros2 = zeroCrossings(logOut);
imshow(zeros2);
title("LOG zero crossings sigma 3");

%Show off overlay for image 2
figure;
reversey2 = reverseCross(zeros2);
overlay2 = labeloverlay(image2, reversey2);
imshow(overlay2);
title("Overlay image 2");

figure;
%Do the last few methods over again for the second image
index = 1;  
for j = 5: 5 : 50
    if mod(j, 2) == 0
        j = j+1;
    end
    log = make2DLOG(j, 2);
    logOut = conv2(image2, log, 'same');
    subplot(2,5,index);
    imshow(logOut);
    title("LOG Changing N= " + j + ", sigma = 2");
    index = index + 1;
end

figure;
index = 1;
for i = 0 : 5
    log = make2DLOG(21, i);
    logOut = conv2(image2, log, 'same');
    subplot(1,6,index);
    imshow(logOut);
    title("Log SIGMA N = 21" + ", sigma = " + i);
    index = index + 1;
end

% Gabor TIME!

% See what happens when changing the orientation of the gabor filter
figure;
index = 1;
for i = 0: 15 : 90
    [eveng, oddg] = make2DGabor(21, 1, i);
    gabOut = conv2(image1, oddg, 'same');
    subplot(2,4,index);
    imshow(gabOut);
    title("Gabor degree= " + i);
    index = index + 1;
end

%See what happens when changing the lambda of the Gabor filter
figure;
index = 1;
for i = 1 : 5
    [eveng, oddg] = make2DGabor(21, i, 30);
    gabOut = conv2(image1, oddg, 'same');
    subplot(1,6,index);
    imshow(gabOut);
    title("Gabor sigma=" + i);
    index = index + 1;
end

%See what happens when changing the size of the Gabor filter
figure;
index = 1;
for i = 1 : 10 : 100
    [eveng, oddg] = make2DGabor(i, 2, 30);
    gabOut = conv2(image1, oddg, 'same');
    subplot(2,5,index);
    imshow(gabOut);
    title("Gabor N=" + i);
    index = index + 1;
end

%Image 2

% See what happens when changing the orientation of the gabor filter
figure;
index = 1;
for i = 0: 15 : 90
    [eveng, oddg] = make2DGabor(21, 1, i);
    gabOut = conv2(image2, oddg, 'same');
    subplot(2,4,index);
    imshow(gabOut);
    title("Gabor degree= " + i);
    index = index + 1;
end

%See what happens when changing the lamba of the Gabor filter
figure;
index = 1;
for i = 1 : 5
    [eveng, oddg] = make2DGabor(21, i, 30);
    gabOut = conv2(image2, oddg, 'same');
    subplot(1,6,index);
    imshow(gabOut);
    title("Gabor sigma=" + i);
    index = index + 1;
end

%See what happens when changing the size of the Gabor filter
figure;
index = 1;
for i = 1 : 10 : 100
    [eveng, oddg] = make2DGabor(i, 2, 30);
    gabOut = conv2(image2, oddg, 'same');
    subplot(2,5,index);
    imshow(gabOut);
    title("Gabor N=" + i);
    index = index + 1;
end

figure;
%Show off the zero zrossings for the gabor filter

[eveng, oddg] = make2DGabor(21, 1, 60);
gabOut = conv2(image1, oddg, 'same');
zerod = zeroCrossings(gabOut);
imshow(zerod);
title("Zero crossings Gabor");

%Show off overlay of Preious Gabor filter
figure;
overlay = labeloverlay(image1, zerod);
imshow(overlay);
title("Overlay");

%Show off best Gabor I found
figure;
[eveng, oddg] = make2DGabor(21, 1, 60);
gabOut = conv2(image1, oddg, 'same');
imshow(gabOut);
title("Best Gabor?");

%image 2
%Zero crossings for image 2
figure;
[eveng, oddg] = make2DGabor(21, 1, 30);
gabOut = conv2(image2, oddg, 'same');
zerod = zeroCrossings(gabOut);
imshow(zerod);
title("Zero crossings Gabor");

%Overlay for image 2
figure;
% reversey = reverseCross(zerod);
overlay = labeloverlay(image2, zerod);
imshow(overlay);
title("Overlay");

%Best Gabor for image2
figure;
[eveng, oddg] = make2DGabor(21, 1, 30);
gabOut = conv2(image2, oddg, 'same');
imshow(gabOut);
title("Best Gabor?");



