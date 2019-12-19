%This function can be used to put more than just 2 images together
%Its input is a past panoramic, and it adds in 1 more new picture
function outputpano = panoramicM(pano, homo1, homo2, newimage)

newpano = imresize(pano, [750, 1000]);
newhomo = homo2 * homo1;
outputpano = panoramic(newhomo, newpano, newimage);

end