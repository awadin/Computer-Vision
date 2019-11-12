% rotate the histogram so that the largest value is in front
function g = shift(directions, gaussMag)

[peaks, indicies] = findpeaks(buckets(directions, gaussMag));
maxPeak = max(peaks);
shifty = 0;
for i = 1 : length(peaks)
    if(peaks(i) == maxPeak)
        shifty = indicies(i);
        break;
    end
end
shifted = circshift(buckets(directions, gaussMag), 37-shifty);
g = shifted;
end