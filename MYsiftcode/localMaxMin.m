%Decides if a point is a local min or max
function [g, mm] = localMaxMin(M)

%Get dimension of input image
max = 0;
min = 0;
point = 0;
flag = "nothing";

g = zeros(length(M), length(M));
mm = zeros(length(M), length(M));

%Loop through the whole picture
for i = 2: length(M) - 2
    for j = 2 : length(M) - 2
        % point were looking at
        point = M(i,j);
        
        %Thresholding
        if(point < 20)
            continue;
        end
        
         %Right point - this will be the first check to see if we are
         %looking for a max or min
         if(point > M(i+1, j))
             max = point;
             flag = "max";
         elseif(point < M(i+1, j))
             min = point;
             flag = "min";
         else
             continue;
         end
         
         % Check if it is a max
         if(strcmp(flag, "max"))
            if(localMaxLoop(M, i, j) == true)
                g(i,j) = max; 
                mm(i,j) = 11;
            end
         end
         
         % Check minimum
         if(strcmp(flag, "min"))
             if(localMinLoop(M, i, j) == true)
                g(i,j) = min;  
                mm(i,j) = -11;
             end
         end 
    end
end

end