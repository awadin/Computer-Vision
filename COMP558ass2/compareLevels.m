% Look at the levels above and below the current point to decide if it
% truly is a min or a max to make it a sift keypoint
% This is used for MAX comparisons, there is a seperate function to see if
% it is a minimum within its local scale space
function g = compareLevels(matrixA, matrixB, indexX, indexY, value)

g = true;
max = value;

%Right
 if(max > matrixA(indexX+1, indexY) && max > matrixB(indexX+1, indexY))
     %Its still a max
 else
     g = false;
     return;
 end

%left
if(max > matrixA(indexX-1, indexY) && max > matrixB(indexX-1, indexY))
           
   else
     g = false;
     return;
end
     
 %above
 if( max > matrixA(indexX, indexY + 1) && max > matrixB(indexX, indexY + 1))

 else
     g = false;
     return;
 end
 %below
 if(max > matrixA(indexX, indexY-1) && max > matrixB(indexX, indexY-1))

 else
     g = false;
     return;
 end
 % Diagonals
 if(max > matrixA(indexX -1, indexY + 1) && max > matrixB(indexX -1, indexY + 1))

 else
     g = false;
     return;
 end
 if(max > matrixA(indexX - 1, indexY - 1) && max > matrixB(indexX - 1, indexY - 1))

 else
     g = false;
     return;
 end
 if(max > matrixA(indexX + 1, indexY + 1) && max > matrixB(indexX + 1, indexY + 1))

 else
     g = false;
     return;
 end
 if(max > matrixA(indexX + 1, indexY - 1) && max > matrixB(indexX + 1, indexY - 1))

 else
     g = false;
     return;
 end 
 return;

end
