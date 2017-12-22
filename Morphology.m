%dilatation & erosion
a = [1 0 0 0 0; 0 1 1 1 0; 0 0 0 0 1];
s = [1 0 0; 1 1 1; 0 0 1];
out1 = imdilate(a,s);
out2 = imerode(a,s);

%%Create morphological structuring element by using strel depending on shape
clear
im = imread('circles.png');
filter = strel('disk',3);
out1 = imerode(im,filter);
imshow(im)
figure
imshow(out1)
out2 = im - out1;
figure
imshow(out2)

%%Cleaning noise by open and close 
%open = erode -> dilate
%close = dilate -> erode

clear
im = imread('circles.png');
double = im2double(im);
noise = imnoise(double,'salt & pepper');
figure
imshow(noise)

filter = strel('disk',1);
open = imopen(noise, filter);
figure
imshow(open)
close = imclose(open, filter);
figure
imshow(close)

%%bwmorph to perform Morphological operations on binary images
clear
im = imread('circles.png');
BW3 = bwmorph(im,'shrink',Inf);
bw = bwmorph(im,'spur');
figure, imshow(BW3)

%%
clear
im = imread('circles.png');
b = bwmorph(im,'thin',Inf);
figure, imshow(b)
