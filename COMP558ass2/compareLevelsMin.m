% Checks the levels above and below the keypoint to see if it is a minimum
% within these scale spaces (mirrors compareLevels)
function g = compareLevelsMin(matrixA, matrixB, indexX, indexY, value)

g = true;
min = value;

%Right
 if(min < matrixA(indexX+1, indexY) && min < matrixB(indexX+1, indexY))
     
 else
     g = false;
     return;
 end

%left
if(min < matrixA(indexX-1, indexY) && min < matrixB(indexX-1, indexY))
           
   else
     g = false;
     return;
end
     
 %above
 if( min < matrixA(indexX, indexY + 1) && min < matrixB(indexX, indexY + 1))

 else
     g = false;
     return;
 end
 %below
 if(min < matrixA(indexX, indexY-1) && min < matrixB(indexX, indexY-1))

 else
     g = false;
     return;
 end
 % Diagonals
 if(min < matrixA(indexX -1, indexY + 1) && min < matrixB(indexX -1, indexY + 1))

 else
     g = false;
     return;
 end
 if(min < matrixA(indexX - 1, indexY - 1) && min < matrixB(indexX - 1, indexY - 1))

 else
     g = false;
     return;
 end
 if(min < matrixA(indexX + 1, indexY + 1) && min < matrixB(indexX + 1, indexY + 1))

 else
     g = false;
     return;
 end
 if(min < matrixA(indexX + 1, indexY - 1) && min < matrixB(indexX + 1, indexY - 1))

 else
     g = false;
     return;
 end 
 return;

end
