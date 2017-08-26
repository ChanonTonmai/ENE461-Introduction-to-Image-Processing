img = imread('lena.jpg');
imgGray = rgb2gray(img);
H = size(imgGray,1);
W = size(imgGray,2);
lambda = 0.1;
alpha = 0.5;
imgRestore = ones(H,W);

imgNoise = imnoise(imgGray,'gaussian');
num = round(H*W*50/100);
M = ones(H,W);
for i = 1:num
    x = unidrnd(H);
    y = unidrnd(W);
    M(x,y) = 0;
    imgNoise(x,y) = 0;
end

imgCal = double(imgNoise);
for n = 1:100
    for x = 2:H-1
        for y = 2:W-1
            E = -2*M(x,y)*(imgCal(x,y)-imgRestore(x,y))...
                -2*lambda*(imgRestore(x+1,y)-imgRestore(x,y))...
                -2*lambda*(imgRestore(x,y+1)-imgRestore(x,y))...
                +2*lambda*(imgRestore(x,y)-imgRestore(x-1,y))...
                +2*lambda*(imgRestore(x,y)-imgRestore(x,y-1));
            imgRestore(x,y) = imgRestore(x,y) - alpha*E;
        end
    end
end

figure,imshow(imgGray)
figure,imshow(imgNoise)
figure,imshow(uint8(imgRestore))
