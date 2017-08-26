original = imread('lena.jpg');
gray = rgb2gray(original);
gray2=gray;
figure,imshow(gray)

[i,j] = size(gray);
histogram = zeros(256,1);
count = 0;
for shade=0:255
	for x=1:i
		for y=1:j
			if gray(x,y)==shade
				count = count+1;
			end
		end
	end
	histogram(shade+1,1)=count;
	count = 0;
end
figure,bar(histogram)
newshade = zeros(256,1);
graypdf = zeros(256,1);
graycdf = zeros(256,1);
count = 0;
for shade=0:255
	graypdf(shade+1,1) = histogram(shade+1,1)/(i*j);
end
for shade=0:255
	for a=1:(shade+1)
		count = count + graypdf(a,1);
	end
	graycdf(shade+1,1) = count;
	count = 0;
end
for shade=0:255
	newshade(shade+1,1) = graycdf(shade+1,1)*255;
end
for x=1:i
    for y=1:j
        gray2(x,y) = newshade(gray(x,y));
    end
end
figure,imhist(gray2)
figure,imshow(gray2)
