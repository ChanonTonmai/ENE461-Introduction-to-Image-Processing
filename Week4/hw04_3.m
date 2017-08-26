% Filtering with the laplacian of gaussian (high-pass filter) 
original = imread('lena.jpg');
gray = rgb2gray(original);
gray2=int32(gray);
mask = ones(3,3);
mask_mean = mask/sum(sum(mask));
mask_gausian = (1/273)*[1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1];
mask_laplacian = [0,1,0;1,-4,1;0,1,0];
mask_laplacian_of_gausian = [0,0,1,0,0;0,1,2,1,0;1,2,-16,2,1;0,1,2,1,0;0,0,1,0,0];
[i,j]=size(gray);
for x=2:(i-1)
    for y=2:(j-1)
        summ=0;
        for X=-1:1
            for Y=-1:1
                summ = summ + (gray2(x+X,y+Y)*mask_laplacian(2+X,2+Y));
            end
        end
        if(summ < 0)
            summ=0;
        end
        if(summ > 255)
            summ=255;
        end
        gray(x,y)=summ;
    end
end
figure,imshow(gray)
