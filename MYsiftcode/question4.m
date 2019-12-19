%Question 4 of the assignment - get patches of each keypoint and save/show
%their mags, dirs, and gauss weighted mags
function [patches1, dirs3, gmagw4] = question4(array, points)
    
%Hold the 15x15 matricies we are working with
patches = cell(size(points,1), 1);
%Holds the magnitudes of each index in our window
mags = cell(size(points,1), 1);
%Holds the directions of each index in our window
dirs = cell(size(points,1), 1);
%Holds the gaussian weighted 
gmagw = cell(size(points,1), 1);
%the level we are working at
cur_sigma = 2;
%Where to store our values
cur_row = 1;
cur_col = 1;
%Our Gaussian Kernel
gauss_kernel = fspecial('gaussian',15,1.5);

% loop through the entire points array
for i = 1:size(points,1)
    % get points
    row = points(i,1);
    col = points(i,2);
    sigma = points(i,3);
    
    % get image at scale
    index = sigma;
    gauss = array{index};
    n = size(gauss,1);
    
    % initialize patch
    patch = zeros(15);
    start_row = row - 7;
    start_col = col - 7;
    
    % get patch
    for y = 0:14
        for x = 0:14
            if start_row + y > 0 && start_row + y < (n+1) && start_col + x > 0 && start_col + x < (n+1)
                patch(y+1,x+1) = gauss(start_row + y, start_col + x); 
            end
        end
    end
    
    % get gradient magnitude and direction
    [gmag, gdir] = imgradient(patch);
    % get weighted gradient
    gmag_w = gmag.* gauss_kernel;
    
    % store results
    patches{cur_row} = patch;
    mags{cur_row} = gmag;
    dirs{cur_row} = gdir;
    gmagw{cur_row} = gmag_w;
    
    % increment row
    cur_row = cur_row + 1;
end

%Show results for an arbitrary point, I choose the 200th index in patches
figure;
subplot(4,1,1);
imshow(patches{200}, []);
subplot(4,1,2);
imshow(mags{200}, []);
subplot(4,1,3);
imshow(dirs{200}, []);
hold on;
quiver(mags{200}, dirs{1});
hold off;
subplot(4,1,4);
imshow(gmagw{200},[]);

%Return the proper values for the next parts of the assignment
patches1 = patches;
dirs3 = dirs;
gmagw4 = gmagw;
end