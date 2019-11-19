function [even, odd] = make2DGabor(N, lambda, angle)
% Gabor Filters on Wikipedia:
% g(x,y,lambda, theta, psi, sigma, gamma) 
% = exp(- x'^2 + gamma^2 * y'^2 / (2 * sigma ^ 2)) * exp(i(2pi * x'/lambda +
% psi))
% x' = xcos(theta) + ycos(theta)
% y' = -xsin(theta) + ycos(theta)
% theta - orientation
% lambda - wavelength
% To get seperate "even" and "odd" functions we re-write the gabor
% equation:
% Even:
% = exp(- x'^2 + gamma^2 * y'^2 / (2 * sigma ^ 2)) * cos(2pi * x'/lambda +
% psi)
% Odd:
% = exp(- x'^2 + gamma^2 * y'^2 / (2 * sigma ^ 2)) * sin(2pi * x'/lambda +
% psi)
% I am assuming gamma = 1, psi = 0. And lambda = sigma (as given in
% instructions)

%Build the right size matrix using a build in meshgrid
[row,col] = meshgrid(-((N-1)/2):((N-1)/2), -((N-1)/2):((N-1)/2));
%X' and Y'
xP = (row)*cos(angle) + (col)*sin(angle);
yP = -(row)*sin(angle) + (col)*cos(angle);
%Exponent applied to each entry in the matrix, so use .^
expon = exp(-(xP.^2 + yP.^2) / (2 * lambda^2));
%Calculate each even and odd matrix seperatly
even = expon.*cos(2 * pi * xP/ lambda);
odd = expon.*sin(2 * pi * xP/ lambda);
end
