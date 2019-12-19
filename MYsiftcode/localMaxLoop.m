%The loop used to check if a point is a local max within an area
function g = localMaxLoop(matrix, indexX, indexY)

g = true;
max = matrix(indexX, indexY);

%left
if(max > matrix(indexX-1, indexY))
           
   else
     g = false;
     return;
end
     
 %above
 if( max > matrix(indexX, indexY + 1))

 else
     g = false;
     return;
 end
 %below
 if(max > matrix(indexX, indexY-1))

 else
     g = false;
     return;
 end
 % Diagonals
 if(max > matrix(indexX -1, indexY + 1))

 else
     g = false;
     return;
 end
 if(max > matrix(indexX - 1, indexY - 1))

 else
     g = false;
     return;
 end
 if(max > matrix(indexX + 1, indexY + 1))

 else
     g = false;
     return;
 end
 if(max > matrix(indexX + 1, indexY - 1))

 else
     g = false;
     return;
 end 
 return;
end