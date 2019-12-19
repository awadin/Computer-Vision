% Bhatt histogram comparison
function g = compareHist(hist1, hist2)

bcoeff = 0;
for i=1:36
    bcoeff = bcoeff + sqrt(hist1(i) * hist2(i));
end
% get the distance between the two distributions as follows
g = sqrt(1 - bcoeff);
end