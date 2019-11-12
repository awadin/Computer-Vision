%Loop to see if a point in a matrix is a local min (mirrors max loop
%counterpart)
function g = localMinLoop(matrix, indexX, indexY)

g = true;
min = matrix(indexX, indexY);

%left
if(min < matrix(indexX-1, indexY))
           
   else
     g = false;
     return;
end
     
 %above
 if( min < matrix(indexX, indexY + 1))

 else
     g = false;
     return;
 end
 %below
 if(min < matrix(indexX, indexY-1))

 else
     g = false;
     return;
 end
 % Diagonals
 if(min < matrix(indexX -1, indexY + 1))

 else
     g = false;
     return;
 end
 if(min < matrix(indexX - 1, indexY - 1))

 else
     g = false;
     return;
 end
 if(min < matrix(indexX + 1, indexY + 1))

 else
     g = false;
     return;
 end
 if(min < matrix(indexX + 1, indexY - 1))

 else
     g = false;
     return;
 end 
 return;

end
