% Pass the gaussian pyramid with which to make the DOG Laplacian Pyramid
function g = DOGPyrBuild(gaussArray)
% Hold levels of each laplacian of gaussian
DOG = cell(6, 1);
newindex = 1;
for i = 2 : 7
    subplot(2,4, newindex);
    DOG{newindex} = gaussArray{i-1} - imresize(gaussArray{i}, 2);
    imshow(DOG{newindex}, []);
    %Too black - threshold needs to be higher?
    title("Laplacian pyramid level " + (i-1));
    newindex = newindex + 1;
end
g = DOG;
end