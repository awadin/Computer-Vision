function g = reverseCross(img)

% Take in proper dimensions of image
g = zeros(length(img), length(img));

% Loop through entire matrix and everywhere there is a 1, put a 0 and vice
% versa
for i = 1 : length(img) - 1
    for j = 1 : length(img) - 1
        if img(i,j) == 1
            g(i, j) = 0;
        else
            g(i,j) = 1;
        end
    end
    
end


end

% This method is needed because the labeloverlay method in matlab takes the
% white parts of the image and overlays that on the underlying image, so
% becuase my zero crossing image shows the zero crossings as black, i
% needed to change that so that the zero crossing showed up in white to be
% properly used in the labeloverlay method