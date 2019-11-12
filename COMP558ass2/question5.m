%Question 5 of the assignment - get histograms of each keypoint and then
%update those keypoints with their histograms
function g = question5(patches, dirs, gmagw, points)

% Hold bin sums
data = cell(length(patches), 1);
%Hold the final histograms to be added at the end of our feature vectors
finalData = cell(length(patches), 1);

% Used to make bar graph (histogram)
bins = zeros(36, 1);
for i = 1 : 36
    bins(i) = i;
end

% things to put into buckets
for i = 1 : length(patches)
    data{i} = buckets(dirs{i}, gmagw{i});
end

figure;
%Example histogram at point 200
graph = bar(bins, data{200});
[peaks, indicies] = findpeaks(graph.YData);
maxPeak = max(peaks);
shifty = 0;
for i = 1 : length(peaks)
    if(peaks(i) == maxPeak)
        shifty = indicies(i);
        break;
    end
end

figure;
%Show how we move the largest value to the front
shifted = circshift(graph.YData, 37-shifty);
bar(shifted);

%Put these shifted histograms into a data structure
for i = 1 : length(patches)
    finalData{i} = shift(dirs{i}, gmagw{i});
end

sift = ones(length(points), 39);

%Fill our sift points as given by the directions!
for i = 1 : length(points)
    sift(i, 1) = points(i, 1);
    sift(i, 2) = points(i, 2);
    sift(i, 3) = points(i, 3);
    for j = 1 : 36
        sift(i, j + 3) = finalData{i}(j);
    end
end
g = sift;
end