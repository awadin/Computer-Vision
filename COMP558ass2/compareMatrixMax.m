%Check to see if a certian matrix is truly a local min or max to make it a
%scalespace keypoint, returns true or false
function g = compareMatrixMax(M1, M2, M3, MM)

g = zeros(length(M1), length(M1));
%M1 = middle
%M2 = big
%M3 = small
newM2 = imresize(M2, 1/2);
newM3 = imresize(M3, 2);

% Loop through the local max array of a level already found
for i = 2 : length(M1) - 2
    for j = 2 : length(M1) - 2
        % When we find an entry that is the local max of that level
        if(M1(i,j) ~= 0)
            %If it is a max
          if(MM(i,j) == 11)
              %Check the levels above and below to see if it is a max in
              %those levels too
            isMax = compareLevels(newM2, newM3, i, j, M1(i,j));
            if(isMax == true)
               g(i,j) = 1;
            end
            
          elseif(MM(i,j) == -11)
              %Check the levels above and below to see if it is a min in
              %those levels too
              isMin = compareLevelsMin(newM2, newM3, i, j, M1(i,j));
              if(isMin == true)
                  g(i,j) = 1;
              end
          end
        end
    end
end

end