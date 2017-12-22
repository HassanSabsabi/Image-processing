%% Periodic noise
clear
clc

im=imread('cameraman.tif');
im=im2double(im);
figure,imshow(im),title('Original image')
% pause
[r c]=size(im);
[x y]=meshgrid(1:c,1:r);

figure,imshow(sin(x+y/2)),title('Periodic noise')

% pause
% close all

im=im+sin(x+y);
figure,imshow(im),title('Noisy image')

% pause
% close

imFT=fftshift(fft2(im));
fftshow(imFT)
impixelinfo

%cleanning Periodic noise
br=sqrt((x-c/2).^2+(y-r/2).^2);
br=(br < 52 | br > 58);
imFT=br.*imFT;
imFT(:,88)=0;
imFT(88,:)=0;
imFT(170,:)=0;
imFT(:,170)=0;

figure,fftshow(imFT)

im=ifft2(fftshift(imFT));
figure,imshow(im)
