function [] = matchPoints(image, transformed, sift1, sift2, x0, y0)
    [sizeX, sizeY] = size(image);
    matches = [];
    
    for j=1:length(sift1)
        %neighborhood looking
        x = sift1(j,1)*2^(sift1(j,3)-1);
        y = sift1(j,2)*2^(sift1(j,3)-1);
        if(abs(x - x0) > sizeX/4 || abs(y - y0) > sizeY/4)
           continue;
        end
        
        best = 1;
        minBhat = bhatta(sift1(j,4:39)*100, sift2(1,4:39)*100);
        if(isnan(minBhat) == 1)
            minBhat = 1;
        end
        for k=2:size(sift2,1)
            bhat = bhatta(sift1(j,4:39), sift2(k,4:39));

            if(bhat < minBhat && isnan(bhat) ~= 1)
                minBhat = bhat;
                best = k;
            end
        end
            x = sift1(j,1)*2^(sift1(j,3)-1);
            x2 = sift2(best,1)*2^(sift2(best,3)-1);
            y = sift1(j,2)*2^(sift1(j,3)-1);
            y2 = sift2(best,2)*2^(sift2(best,3)-1);
            matches = [matches; minBhat x y x2 y2];
    end
    
    size1 = size(image,1);
    size2 = size(transformed, 1);
    
    original = image;
    rotated = transformed;
    if(size1 > size2)
        original = imtranslate(original,-[size1-size2, size1-size2],'OutputView','full');
    else
        rotated = imtranslate(rotated,-[size2-size1, size2-size1],'OutputView','full');    
    end
    figure;
    imshow([original rotated]);
    hold on;
    
    %draw lines
    for j=1:size(matches,1)
        bhat = matches(j,1);
        x = matches(j,2);
        y = matches(j,3);
        x2 = matches(j,4) + size(original,1);
        y2 = matches(j,5);
        if(bhat ~= 1)
            plot([x x2], [y y2], 'LineWidth', 0.5, 'Color', 'red');
        end
    end
    hold off;
end