img = imread('lena.jpg');
original = rgb2gray(img);
[h,w]=size(original);
freqoriginal=fft2(original);
imshow(abs(freqoriginal));
masklow=[];
maskhigh=[];
d0=100;
for x=1:w
    for y=1:h
        masklow(y,x)=exp(-((x-floor(w/2))^2+(y-floor(h/2))^2)^2/(2*d0^2));
        maskhigh(y,x)=1-exp(-((x-floor(w/2))^2+(y-floor(h/2))^2)^2/(2*d0^2));
    end
end
freqoriginal2=freqoriginal;
freqoriginal=fftshift(freqoriginal).*masklow;
freqoriginal2=fftshift(freqoriginal2).*maskhigh;
original2=ifft2((freqoriginal));
original3=ifft2((freqoriginal2));
mag2=abs(original2);
mag3=abs(original3);
figure,imshow(uint8(mag2))
figure,imshow(uint8(mag3))