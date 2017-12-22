%% make image brighter (gray & RGB)
clear 
im = imread('cameraman.tif');
im = im+50;
imshow(im)

im2 =imread('onion.png');
im2 = im2+50;
figure
imshow(im2)

im2 = im2(:,:,2) + 50;
figure
imshow(im2)

%%Make indexed image brighter
clear 
[im, m] = imread('trees.tif');
%m = m+0.50;    wrong
%im = im+50;    wrong

for i=1:size(m)
    for j =1:3 
if m(i,j)+0.5 > 1
    m(i,j) =1;
else
    m(i,j)= m(i,j)+0.5;
end
    end
end
figure
imshow(im,m)

%% How imhist is working?
clear 
im = imread('cameraman.tif');
n=size(im);
f = zeros(n);
for i=1 : n
    for j=1:n
       f(im(i,j)) = f(im(i,j))+1;
    end 
end
m = 0:255;
figure
plot(m,f)

%%imhist for gray image
clear 
im = imread('cameraman.tif');
figure
[count,x] = imhist(im);

%%imhist for RGB image
clear 
im = imread('onion.png');

%imhist(im)     wrong
[a1,b1] = imhist(im(:,:,1));
[a2,b2] = imhist(im(:,:,2));
[a3,b3] = imhist(im(:,:,3));
figure
plot(b1,a1,'r',b2,a2,'g',b3,a3,'b')

%%imhist for indexed image
clear 
[im,m] = imread('trees.tif');
figure
imhist(im,m)

%%imadjust for gray image
clear
gray=imread('pout.tif');
imhist(gray)
x = stretchlim(gray);
low = x(1);
high = x(2);
new = imadjust(gray,[low,high],[0,1]);
figure
imshow(new)
figure
imhist(new)

%% imadjust for indexed image
clear
[im,m] = imread('forest.tif');
figure
imhist(im,m)
x = stretchlim(m);
low = 0.3;
high = 0.9;
new = imadjust(m,[low,high],[0,1],0.5);
figure
imshow(im,new)
figure
imhist(im,new)