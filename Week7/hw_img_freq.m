img = imread('lena.jpg');
original = rgb2gray(img);
[h,w,d]=size(original);
freqoriginal=fft2(original);
mask=[];
for z=1:d
    for x=1:w
        for y=1:h
            if (x-floor(w/2))^2+(y-floor(h/2))^2>30^2
                mask(y,x,z)=1;
            else
                mask(y,x,z)=0;
            end
        end
    end
end
freqoriginal=fftshift(freqoriginal).*mask;
original2=ifft2((freqoriginal));
mag2=abs(original2);
imshow(uint8(mag2))