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

check1 = 0;
check2 = 0;
b = 0;
first = 0;
second = 0;
for shade=0:255
	if (histogram(shade+1)>=check1)
		check1 = histogram(shade+1);
		first = shade;
	else
		check1 = check1;
	end
end
for shade=1:255
	if (histogram(shade+1) ~= check1)
		if (histogram(shade+1)>check2 && abs((shade+1)-first)>20)
			check2 = histogram(shade+1);
			second = shade;
		else
			check2 = check2;
		end
	end
end
m = (check1-check2)/(first-second);
c = check1-(m*first);
dmost = 0;
third = 0;
for shade=first:second
	d = abs((m*shade)-histogram(shade+1)+c)/sqrt(m*m+1);
	if (d>=dmost)
		dmost = d;
		third= shade;
	else
		dmost = dmost;
	end
end
figure,im2bw(gray,third/255)