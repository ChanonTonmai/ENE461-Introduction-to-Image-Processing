%written by Pisit Rerkwijitnan
clc
clear
im = rgb2gray(imread('C:\Users\Ruk\Desktop\pic\18.jpg'));
figure,imagesc(im),colormap gray;
 
fftim = fftshift(fft2(double(im)));
mag = abs(fftim);
figure,imshow(mag, []);
figure,imshow(log(1 + mag), []);
 
n=1;
d=50;
h=size(im,1);
w=size(im,2);
[x y]=meshgrid(-floor(w/2):floor(w/2)-1,-floor(h/2):floor(h/2)-1);
hhp=1./(1+(d./(x.^2+y.^2).^0.5).^(2*n));
hlp=1-hhp;
 
figure,imshow(hhp);
hpfftim = fftim .* hhp;
hpim = uint8(real(ifft2(ifftshift(hpfftim))));
figure,imagesc(hpim),colormap gray;
 
figure,imshow(hlp);
lpfftim = fftim .* hlp;
lpim = uint8(real(ifft2(ifftshift(lpfftim))));
figure,imagesc(lpim),colormap gray;
