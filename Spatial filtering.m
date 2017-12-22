%Linear Filtering of Images Using imfilte-Correlation
%%Correlation & Convolution with imfilter
clear
im = imread('cameraman.tif');
h=[1 1 1; 0 0 0; 0 0 0];
im2 = imfilter(im,h,'corr');
figure
imshow(im2)

im3 = imread('onion.png');
im4 = imfilter(im3,h,'conv');
figure
imshow(im4)

%%fspecial filters
clear
im3 = imread('onion.png');
%low pass filters
%	average
%	gaussian
%	unshap
%	motion
%High pass filters
%	laplacian
%	log
%	sobel
%	prewitt
hh = fspecial('sobel');
im5 = imfilter(im3,hh);
imshow(im5)

%%Cleaning salt and pepper noise by median filter
clear
im = imread('cameraman.tif');
im2 = imnoise(im, 'salt & pepper');
%h= fspecial('average',9);
% out = imfilter(im2,h);
out2 = medfilt2(im2);
imshow(out2)

%%The outlier method
clear
im = imread('cameraman.tif');
im2 = imnoise(im, 'salt & pepper');
f = 1/8*[1 1 1; 1 0 1; 1 1 1];
d = 2;
imd = im2double(im2);
imf = imfilter(imd,f);
r = abs(imd-imf)>d;
out = r.*imf + ~r.*imf;
imshow(out)