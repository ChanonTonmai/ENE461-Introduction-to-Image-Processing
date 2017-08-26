original = imread('lena.jpg');
[i,j,k]=size(original);
flippic = original;
for z=1:k
    for x=1:i
        for y=1:j
            flippic(x,y,z)=original(x,(j+1)-y,z);
        end
    end
end
figure,imshow(flippic)
