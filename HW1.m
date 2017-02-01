%HW1 ENE 461 Introduction to Image Processing
%Read the image file and then convert to greyscale without using matlab
%function and show the histogram and finally create a binary image
%Edit by Chanon Khongprasongsiri 
%20 Jan 2017
%read image 
rgbImage = imread('lenna.jpg'); 

%find size of rows and column
[rows, columns, numberOfColorChannels] = size(rgbImage);

%read the rgb channel 
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

%-----------------------------------------------------------------------------------------

%grayscale algrithm
grayImage = .299*(redChannel) + .587*(greenChannel) + .114*(blueChannel);

imshow(grayImage)

%read the grayscale size
[rows_gray, columns_gray, numberOfColorChannels_gray] = size(grayImage);

%-----------------------------------------------------------------------------------------

%Find the number of the value of each element
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

%-----------------------------------------------------------------------------------------

%threshold = 120
for i=1:rows_gray
    for j=1:columns_gray
        if grayImage(i,j) > 120 
            binarize(i,j) = 1;
        else 
            binarize(i,j) = 0;
        end
    end
end

%-----------------------------------------------------------------------------------------
%Result
figure,imshow(binarize)
figure,imshow(grayImage)

disp(t')
n=0:255;
figure,bar(n,t); 
grid on;
ylabel('no. of pixels with such intensity levels---->');
xlabel('intensity levels---->'); title('HISTOGRAM OF THE IMAGE')

