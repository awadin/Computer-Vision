%Alter the image dimensions according to the directions (6) rotation and
%scale
function g = rotate(image, x0, y0, theta, s)
   
[height, width] = size(image);

%move image to new "center" coordinates
T1 = maketform('affine',[1 0 0; 0 1 0; x0 y0 1]);
%Rotate image around those coorindates
R1 = maketform('affine',[cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1]);
%Move the image back to original coordinates
T2 = maketform('affine',[1 0 0; 0 1 0; -x0 -y0 1]);

tform = maketform('composite', T1, R1, T2);
J = imtransform(imresize(image, s), tform, 'XData', [1 width], 'YData', [1 height]);
g = J;
%resizing is strange
end