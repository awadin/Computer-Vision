% This function fills each bin with the correct amount of gauss magnitude.
function g = buckets(directions, magnitudes)
    
%Create the 36 buckets (bins)
bucket = zeros(1,36);

%Loop through both the orientation array (directions) and corresponding
%mags
for i = 1 : 15
    for j  = 1 : 15
        %Get the angle for the current index
        angle = directions(i,j);
        % Set the angle to the right bin as given by the directions
        index = getIndex(angle);
        % Put the right amount of magnatude into the right bin, summing
        % past inputs
        bucket(1,index) = bucket(1, index) + magnitudes(i,j);
    end
end
% Return the bins to be used to compute the histogram
g = bucket;


end