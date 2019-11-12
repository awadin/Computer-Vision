% Question 7 - display images essentially, next to one another
function g = question7(i1, i2)
[rows1,cols1] = size(i1);
[rows2,cols2] = size(i2);

%Create blank image
stackedImage = zeros(max([rows1,rows2]), cols1+cols2);
stackedImage = cast(stackedImage, class(i1));

%Show 2 images
stackedImage(1:rows1,1:cols1) = i1;
stackedImage(1:rows2,cols1+1:cols1+cols2) = i2;

g = stackedImage;
end