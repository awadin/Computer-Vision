function g = make2DGaussian(N, sigma)

%Size of the matrix from input - assumed to be odd
size = N;
%N = 2M + 1
g = zeros(size, size);
%Center for matrix 
%M + 1 = (N-1)/2 + 1
x0=((N-1)/2) + 1; 
y0=((N-1)/2) + 1;
%This loops makes the matrix symmetrical
for col = 1 : N
  for row = 1 : N
      %Gaussian constant:
      c = 1/(2*pi*(sigma^2));
      %For each element in the array, apply gaussian equation - keep it
      %centered around specified center
    g(row, col) = c* exp (-((row-x0)^2 + (col-y0)^2)/(2*sigma^2));
  end
end

end

