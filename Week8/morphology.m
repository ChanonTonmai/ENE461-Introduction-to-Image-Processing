img = imread('lena.jpg');
original = im2bw(img);
original3=original;
original4=original;
[h,w]=size(original);
mask=ones(3,3);
[i,j]=size(mask);
original2=mask;
n=1;
for x=i-1:h-i-1
    for y=j-1:w-j-1
        original2=original(x:x+i-1,y:y+j-1);
        if(original(x,y)==1)
            if(sum(sum(original2))>1)
                original3(x:x+i-2,y:y+j-2)=1;              
            end
            if(sum(sum(~(original2)))>4)
                original4(x,y)=0;
            end
        end
    end
end
figure,imshow(original);
figure,imshow(original3);
figure,imshow(original4);
