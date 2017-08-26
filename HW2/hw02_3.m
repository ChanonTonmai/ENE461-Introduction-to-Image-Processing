% written by Ma-prang Ncpy
gray = rgb2gray(imread('test.jpg'));
 
[i,j] = size(gray);
initt=70;
count=70;
for x = 1:i	
	for y = 1:j
		if gray(x,y) > initt
			gray(x,y) = initt;
		else
			gray(x,y) = 0;
		end
	end
end
gray2=gray;
for x = 1:i	
	for y = 1:j
		if gray(x,y) == initt
			gray2(x,y) = count;
			if gray(x-1,y-1)==initt
				gray2(x,y) = gray2(x-1,y-1);
			elseif gray(x-1,y)==initt
				gray2(x,y) = gray2(x-1,y);
			elseif gray(x-1,y+1)==initt
				gray2(x,y) = gray2(x-1,y+1);
			elseif gray(x,y-1)==initt
				gray2(x,y) = gray2(x,y-1);
				if gray(x,y+1)~=initt
					count = count+10;
				end   
			elseif gray(x,y+1)~=initt
				count = count+10;
			end
		end
	end
end

for x=1:i
	for y=1:j
		if gray2(x,y)==initt+20
			gray2(x,y) = initt+20;
		end
		if gray2(x,y)==initt+80
			gray2(x,y) = initt+40;
		end
		if gray2(x,y)==initt+150 || gray2(x,y)==initt+70
			gray2(x,y) = initt+60;
		end
	end
end

figure, imshow(gray2)
