rgbImage = imread('ene461.bmp');
grayImage = rgb2gray(rgbImage);
binImage = imbinarize(grayImage);

A = ~binImage;
imshow(binImage)

B = zeros(size(A));

[rows_gray, columns_gray, numberOfColorChannels_gray] = size(grayImage);

label = 0;
c = 0;

for i=2:rows_gray-1
    for j=2:columns_gray-1
   if A(i,j) == 1
         if A(i,j) == A(i,j-1) 
            B(i,j) = B(i,j-1);
            disp a;
        elseif A(i,j) == A(i-1,j-1)
            B(i,j) = B(i-1,j-1);
            disp b;
        elseif A(i,j) == A(i-1,j)
            B(i,j) = B(i-1,j);
            disp c;
        elseif A(i,j) == A(i-1,j+1)
            B(i,j) = B(i-1,j+1);
            disp d;
        else
            B(i,j) = label+1;
            label = label+1;
            disp e;
         end    
   end

    end
end
for i=2:rows_gray-1
    for j=2:columns_gray-1
    if (A(i-1,j-1) == A(i,j-1) && B(i-1,j-1) ~= B(i,j-1)) %AD
       c = B(i-1,j-1); 
       d = B(i,j-1); 
       e = min(c,d);
       f = max(c,d);
       [row, col] = find(B==f);
       for x=1:length(row)
           B(row(x),col(x)) = e;
       end
       
   end
   if (A(i-1,j) == A(i,j-1) && B(i-1,j) ~= B(i,j-1)) %DB
       c = B(i-1,j); 
       d = B(i,j-1);
       e = min(c,d);
       f = max(c,d);
       [row, col] = find(B==f);
       for x=1:length(row)
           B(row(x),col(x)) = e;
       end
   end
   if (A(i-1,j) == A(i,j) && B(i-1,j) ~= B(i,j)) %BE
       c = B(i-1,j); 
       d = B(i,j);
       e = min(c,d);
       f = max(c,d);
       [row, col] = find(B==f);
       for x=1:length(row)
           B(row(x),col(x)) = e;
       end
   end
    if (A(i-1,j-1) == A(i,j) && B(i-1,j-1) ~= B(i,j)) %AE
       c = B(i-1,j-1); 
       d = B(i,j);
       e = min(c,d);
       f = max(c,d);
       [row, col] = find(B==f);
       for x=1:length(row)
           B(row(x),col(x)) = e;
       end
    end
    if (A(i+1,j) == A(i,j) && B(i+1,j) ~= B(i,j)) %AE
       c = B(i+1,j); 
       d = B(i,j);
       e = min(c,d);
       f = max(c,d);
       [row, col] = find(B==f);
       for x=1:length(row)
           B(row(x),col(x)) = e;
       end
    
    end
    end
end

q = union(B,B);
number_of_object = length(q)-1;
str1 = 'There are ';
str2 = num2str(number_of_object); 
str3 = 'objects in this picture.';
str = strcat(str1,{' '},str2,{' '},str3);
RGB = label2rgb(B);
figure, imshow(RGB)
title(str,'FontSize',17);

