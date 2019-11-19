function g = make2DLOG(N, sigma)

size = N;
%N = 2M + 1
g = zeros(size, size);
%Center for matrix 
%M + 1 = (N-1)/2 + 1
x0=((N-1)/2) + 1; 
y0=((N-1)/2) + 1;
%This loops makes the matrix symmetrical
%Laplacian constant:
c = -1 / (pi * sigma^4);
for col = 1 : N
  for row = 1 : N
      %Apply Laplacian equation to every element, while keeping it
      %symmentrical around the center element
      term1 = 1 - (((row-x0)^2 + (col-y0)^2) / (2 * sigma^2));
      expon = exp (-1*(((row-x0)^2 + (col-y0)^2)/ (2 * sigma^2)));
    g(row, col) = c * term1 * expon;
  end
end

end