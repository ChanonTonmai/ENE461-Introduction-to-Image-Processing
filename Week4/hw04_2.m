original = imread('lena.jpg');
gray = rgb2gray(original);
mask = ones(3,3);
mask_mean = mask/sum(sum(mask));
mask_gausian = (1/273)*[1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1];
mask_laplacian = [0,1,0;1,-4,1;0,1,0];
[i,j]=size(gray);
for x=3:(i-2)
    for y=3:(j-2)
        summ = 0;
        for X=-2:2
            for Y=-2:2
                summ = summ + (gray(x+X,y+Y)*mask_gausian(3+X,3+Y));
            end
        end
        gray(x,y) = summ;
    end
end
figure,imshow(gray)