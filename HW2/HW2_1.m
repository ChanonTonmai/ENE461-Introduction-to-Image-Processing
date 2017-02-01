%HW2 ENE 461 Introduction to image processing 
%1. Auto threshold by using Maximum Normal Line method 
%2. Auto threshold by using Average Intensities Method 
%3. Auto threshold by using Your own method (optional) 
%4. Blob coloring by using without matlab function
%% Auto threshold by using Maximum Normal Line method
clc,clear all, close all
rgbImage = imread('lenna.jpg'); 
grayImage = rgb2gray(rgbImage);
[rows_gray, columns_gray, numberOfColorChannels_gray] = size(grayImage);

t=1:256;
count = 0;

for z=1:256 
    for i=1:rows_gray
        for j=1:columns_gray
            if grayImage(i,j) == z-1
                count = count+1;
            end
        end
    end
            t(z) = count;
            count = 0;
end

pks = findpeaks(t);
pks2 = findpeaks(pks);
val = sort(pks2,'descend');

%The first peak is val(1) and the second peak is val(2)
%Find the position of val(1) and val(2)

for z=1:256 
    if t(z) == val(1)
        position1 = z;
    end
    if t(z) == val(2)
        position2 = z; 
    end
end

slope = (val(1)-val(2))/(position1 - position2);
c = val(1) - slope*position1; 

for i=position1:position2
    upper = abs(slope*i-t(z)+c);
    diff(i) = upper/ sqrt((slope^2)-1);
end

[M,I] = max(diff); 
%max different is M and in the position I 
%so the threshold is in the position position1+I

for i=1:rows_gray
    for j=1:columns_gray
        if grayImage(i,j) > position1+I
            binarize(i,j) = 1;
        else 
            binarize(i,j) = 0;
        end
    end
end

%result
figure,imshow(binarize);

%% Auto threshold by using Average Intensities Method 
sum_all = 0;
for z=1:256
    sum_all = sum_all + t(z);
    prod_all(z) = z*t(z);
end

threshold = sum(prod_all)/sum_all;

i = 0;
sum_low = 0;
sum_high = 0;
while i < 3 
    for z=1:round(threshold)
        sum_low = sum_low + t(z);
        prod_low(z) = z*t(z);
    end
    for z=round(threshold+1):256
        sum_high = sum_high + t(z);
        prod_high(z) = z*t(z);
    end
%     
    mean_low = sum(prod_low)/sum_low;
    mean_high = sum(prod_high)/sum_high;
%     
    threshold = mean_low+mean_high/2;
    i = i+1;
end

threshold

for i=1:rows_gray
    for j=1:columns_gray
        if grayImage(i,j) > threshold
            binarize(i,j) = 1;
        else 
            binarize(i,j) = 0;
        end
    end
end

figure,imshow(binarize);
