% written by Ma-prang Ncpy
gray = rgb2gray(imread('lena.jpg'));
figure,imshow(gray)
histogram = [];
count = 0;
[i,j] = size(gray);
for shade=0:255
	for x=1:i
		for y=1:j
			if gray(x,y)==shade
				count = count+1;
			end
		end
	end
	histogram(shade+1)=count;
	count = 0;
end
figure,bar(histogram)
thresh = 80;
thresh_old = 0;
while (abs(thresh_old-thresh)>3)	
	thresh_old = thresh;
	G1 = 0;
	for shade=1:thresh
		G1 = G1+shade;
	end
	G1=G1/thresh;
	G2 = 0;
	for shade=(thresh+1):255
		G2 = G2+shade;
	end
	G2=G2/(255-thresh);
	thresh = (G1+G2)/2;
	thresh  = round(thresh);
end
figure,im2bw(gray, thresh /255)
