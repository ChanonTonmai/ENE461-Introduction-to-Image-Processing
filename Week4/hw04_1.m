% Filtering with the mask ones 
%            --- --- ---
%           | 1 | 1 | 1 |
%            --- --- ---
% image *   | 1 | 1 | 1 |
%            --- --- ---
%           | 1 | 1 | 1 |
%            --- --- ---
original = imread('lena.jpg');
gray = rgb2gray(original);
mask = ones(3,3);
a = zeros(9,1);
[i,j]=size(gray);
for x=2:i-1
    for y=2:j-1
    	a(1)=gray(x-1,y-1)*mask(1,1);
    	a(2)=gray(x-1,y)*mask(1,2);
    	a(3)=gray(x,y-1)*mask(1,3);
    	a(4)=gray(x-1,y+1)*mask(2,1);
    	a(5)=gray(x,y)*mask(2,2);
    	a(6)=gray(x,y+1)*mask(2,3);
    	a(7)=gray(x+1,y-1)*mask(3,1);
    	a(8)=gray(x+1,y)*mask(3,2);
    	a(9)=gray(x+1,y+1)*mask(3,3);
        gray(x,y)=sum(a)/sum(sum(mask));
    end
end
figure,imshow(gray)
