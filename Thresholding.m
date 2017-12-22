%%Binaraize gray image (Single thresholding)
clear
im = imread('rice.png');
th = graythresh(im);
bw = im2bw(im,th);
imshow(bw)

%%Double thresholding
clear
[im,m] = imread('spine.tif');
gray = ind2gray(im,m);
impixelinfo(imshow(gray))
im2 = gray>180 & gray<242;
figure
imshow(im2)

%%Adaptive thresholding
clear
close all

im = imread('circles.png');
[a,b] = size(im);
[x,y] = meshgrid(1:a,1:b);
im2 = mat2gray(x);

im3 = im2.*(im+0.5);
figure
imshow(im3)
im4 = ~im.*im2;
figure
imshow(im4)

im5 = im2+im4;
figure
imshow(im5)

c = floor(b/4);
a1 = im5(:,1:c);
a2 = im5(:,c:2*c);
a3 = im5(:,2*c:3*c);
a4 = im5(:,3*c:4*c);

th1 = graythresh(a1);
bw1 = im2bw(a1,th1);
th2 = graythresh(a2);
bw2 = im2bw(a2,th2);
th3 = graythresh(a3);
bw3 = im2bw(a3,th3);
th4 = graythresh(a4);
bw4 = im2bw(a4,th4);

ii=ones(a,1);
figure
%subplot(1,2,1),imshow([a1 ii a2 ii a3 ii a4])
imshow([a1 ii a2 ii a3 ii a4])
%subplot(1,2,2),
figure
imshow([bw1 bw2 bw3 bw4])
