function g = zeroCrossings(M)

%Get dimension of input image
g = zeros(length(M), length(M));

%Loop through the whole picture
for i = 2: length(M) - 1
    for j = 2 : length(M) - 1
        %If the pixels above, below, left and right around a given pixel is
        %multiplied together, and it is negative, then there is a zero
        %crossing at that point.
         if((M(i,j)*M(i+1, j) * M(i-1, j) * M(i, j + 1) * M(i, j-1)) < 0)
             g(i,j) = 1;
         else
             g(i,j) = 0;
         end
    end
end

end