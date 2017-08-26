% written by Pisit Rerkwijitnan
clc
clear
im1=imread('C:\Users\Ruk\Desktop\pic\10.png');
im=imfinfo('C:\Users\Ruk\Desktop\pic\10.png');
imshow(im1)
imG=rgb2gray(im1);
imB=im2bw(imG);
 
H=im.Height;
W=im.Width;
n=sum(sum(imB));
m=[-2:2];
c=zeros(n,5);
 
%pick up data
n=1;
for i = 1:H
    for j = 1:W
        if imB(i,j)==1
            c(n,:)=(-i*m)+j;
            n=n+1;
        end
    end
end
 
figure,plot(m,c)
xlabel('m or Slope')
ylabel('C')
title('Hough Transform')
