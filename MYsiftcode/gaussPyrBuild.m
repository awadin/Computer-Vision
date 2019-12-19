% Buils Gaussian pyramid from an image
function g = gaussPyrBuild(image)
index = 1;
% Hold Gaussian Levels 
array = cell(7, 1);
for i = 0 : 6
        gauss = imgaussfilt(image, 2^i);
    if( i ~= 0)
        gaussResize = imresize(gauss, 1/(2^i));
    else
        gaussResize = gauss;
    end
    array{i+1} = gaussResize;
    % Figure out how to display resized images in subplots!
    subplot(2,4,index);
    imshow(gaussResize);
    title("Gaussian pyramid level " + (i+1) + ", sigma = " + 2^i);
    index = index + 1;
end
g = array;

end
