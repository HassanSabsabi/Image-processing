%% Convolution theorm --> LOG
clear
clc
im = imread('cameraman.tif');
imshow(im),title('Original image' )

pause 
close

imFT=fftshift(fft2(im));
figure,fftshow(imFT),title('Fourier transform ---> image' )

pause 
close 

[r c]=size(im);
f =fspecial('gaussian');
imshow(f),title('Gaussian filter' )

pause 
close

figure,freqz2(f),title('Frequency response --> Gaussian filter')

pause 
close 

fFT=fftshift(fft2(f,r,c));

figure,fftshow(fFT),title('Fourier transform ---> Gaussian filter' )
figure,fftshow(fFT.*imFT),title('DFT(image)* DFT(filter)' )

pause 
close all
freqF=mat2gray(ifft2(fftshift(fFT.*imFT)),[0 255]);

figure,imshow(freqF),title('Gaussian filter ---> Fourier')

spatialF=imfilter(im,f);
figure,imshow(spatialF),title('Gaussian filter ---> Spatial')

pause 
close all


%%
clear
clc
bw=imread('circles.png');

a = fspecial('log');

result=real(ifft2(fft2(bw).*fft2(a,256,256)));
imshow(result)

figure,imshow(imfilter(bw,a))

pause
close all

%% Ideal Lowpass filter
clear
clc

im=imread('cameraman.tif');
[y x]=size(im);
r=20;

[X Y]=meshgrid(1:x,1:y);
C=(X-x/2).^2+(Y-y/2).^2<=r^2;

figure,imshow(C)
imft=fftshift(fft2(im));
figure,fftshow(imft)

fim=imft.*C;
figure,fftshow(fftshift(fim))

new_im=ifft2((fim));
figure,fftshow(new_im,'abs')

pause
close all

%% Ideal Highpass filter
clear
clc

im=imread('cameraman.tif');
[y x]=size(im);
r=20;

[X Y]=meshgrid(1:x,1:y);
C=(X-x/2).^2+(Y-y/2).^2>=r^2;

figure,imshow(C)
imft=fftshift(fft2(im));
figure,fftshow(imft)

fim=imft.*C;
figure,fftshow(fim)

new_im=ifft2(fim);
figure,fftshow(new_im,'abs')

pause
close all

%% Butterworth Low pass filter
clear
clc

n=2;
D=30;

im=imread('cameraman.tif');

[r c]=size(im);
[x y]=meshgrid(1:c,1:r);
f=sqrt((x-c/2).^2+(y-r/2).^2);

f=1./(1+(f./D).^(2*n));
imshow(f)

imFt=fftshift(fft2(im));

new_im=ifft2(fftshift(imFt.*f));
fftshow(new_im,'abs')

%% Butterworth High pass filter
clear
clc

n=2;
D=30;

im=imread('cameraman.tif');

[r c]=size(im);
[x y]=meshgrid(1:c,1:r);
f=sqrt((x-c/2).^2+(y-r/2).^2);

f=1./(1+(D./f).^(2*n));
imshow(f)

imFt=fftshift(fft2(im));

new_im=ifft2(fftshift(imFt.*f));
fftshow(new_im,'abs')
