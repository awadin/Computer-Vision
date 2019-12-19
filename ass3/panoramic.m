%This function stiches 2 images together according to their homography
function outputpano = panoramic(homo, im1, im2)
%Function created from online sources and help from classmates
T = maketform('projective', inv(homo)');
[im2transform,xdataim2t,ydataim2t]=imtransform(im2,T);
%xdataim2t and ydataim2t store bounds of the transformed image
xdata=[min(1,xdataim2t(1)) max(size(im1,2),xdataim2t(2))];
ydata=[min(1,ydataim2t(1)) max(size(im1,1),ydataim2t(2))];
% warp one image onto the other
im2transform=imtransform(im2,T,'XData',xdata,'YData',ydata);
im1t=imtransform(im1,maketform('affine',eye(3)),'XData',xdata,'YData',ydata);
%Get the correct size for the output window
outputpano=im1t/2+im2transform/2;
figure;
imshow(outputpano);

end