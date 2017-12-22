%Fourier Transform for gray image
im = imread('cameraman.tif');
%im=imread('pout.tif');
im2 = fft2(im);
im3 = fftshift(im2);
imshow(im2)
figure
imshow(abs(im2)/max(max(abs(im2))))
figure
imshow(im3)
figure
imshow(mat2gray(log(1+abs(im2))))
figure
imshow(mat2gray(log(1+abs(im3))))

%%Fourier Transform for RGB image(text image)
im = imread('ab.monocrom');
im3 = rgb2gray(im);
im2 = fftshift(fft2(im3));
figure
imshow(im3)
figure
MyFshow(im2,'abs')

im4 = imrotate(im3,45);
im44 = fftshift(fft2(im4));
figure
imshow(im4)
figure
MyFshow(im44,'log')