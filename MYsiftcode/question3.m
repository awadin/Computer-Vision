%Question 3 of the assignment - generate and show keypoints
function g = question3(DOG, image)
%Get max/min points at each level
[B, MM1] = localMaxMin(DOG{2});
[C, MM2] = localMaxMin(DOG{3});
[D, MM3] = localMaxMin(DOG{4});
[E, MM4] = localMaxMin(DOG{5});

%compare these max points to higher and lower level to decide if they are
%keypoints
%Save points found 1 = keypoint, 0 = no keypoint
test = compareMatrixMax(B, DOG{1}, DOG{3}, MM1);
test2 = compareMatrixMax(C, DOG{2}, DOG{4}, MM2);
test3 = compareMatrixMax(D, DOG{3}, DOG{5}, MM3);
test4 = compareMatrixMax(E, DOG{4}, DOG{6}, MM4);

%Hold our keypoints by x, y, sigma
points = ones(500, 3);

index = 1;
%Loop through all keypoints and assign them the proper values within points
for i = 1 : length(test)
    for j = 1 : length(test)
        
        if(test(i,j) == 1)
            points(index, 1) = i;
            points(index, 2) = j;
            points(index, 3) = 2;
            index = index + 1;
        end
        
        if( i > 256 || j > 256)
            continue;
        else
            if(test2(i,j) == 1)
                points(index, 1) = i;
                points(index, 2) = j;
                points(index, 3) = 3;
                index = index + 1;
            end
        end
        
        if( i > 128 || j > 128)
            continue;
        else
            if(test3(i,j) == 1)
                points(index, 1) = i;
                points(index, 2) = j;
                points(index, 3) = 4;
                index = index + 1;
            end
        end
        
        if( i > 64 || j > 64)
            continue;
        else
            if(test4(i,j) == 1)
                points(index, 1) = i;
                points(index, 2) = j;
                points(index, 3) = 5;
                index = index + 1;
            end
        end
        
    end
end
    
%Draw circles!
figure;
imshow(image);

for i = 1 : length(points)
    if(points(i, 3) == 2)
        tempr = points(i, 1);
        tempc = points(i, 2);
        center = [tempc*2, tempr*2];
        viscircles(center, 1, 'EdgeColor', 'b');
    end
    if(points(i, 3) == 3)
        tempr = points(i, 1);
        tempc = points(i, 2);
        center = [tempc*4, tempr*4];
        viscircles(center, 5, 'EdgeColor', 'g');
    end
    if(points(i,3) == 4)
        tempr = points(i, 1);
        tempc = points(i, 2);
        center = [tempc*8, tempr*8];
        viscircles(center, 10, 'EdgeColor', 'y');
    end
    if(points(i,3) == 5)
        tempr = points(i, 1);
        tempc = points(i, 2);
        center = [tempc*16, tempr*16];
        viscircles(center, 20, 'EdgeColor', 'm');
    end
end
g = points;
end