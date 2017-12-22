%histogram equalization for gray image
gray=imread('pout.tif');
ph=histeq(gray);
figure
subplot(3,4,1)
imshow(gray)
subplot(3,4,2)
imhist(gray)
subplot(3,4,3)
imshow(ph)
subplot(3,4,4)
imhist(ph)

%histogram equalization for RGB image
rgb = imread('onion.png');
[a1,b1] = imhist(rgb(:,:,1));
[a2,b2] = imhist(rgb(:,:,2));
[a3,b3] = imhist(rgb(:,:,3));
subplot(3,4,5)
imshow(rgb)
subplot(3,4,6)
plot(b1,a1,'r',b2,a2,'g',b3,a3,'b')

heqr = histeq(rgb(:,:,1));
heqg = histeq(rgb(:,:,2));
heqb = histeq(rgb(:,:,3));

rgb2 = cat(3,heqr,heqg,heqb);
subplot(3,4,7)
imshow(rgb2)

[a,b] = imhist(heqr);
[c,d] = imhist(heqg);
[e,f] = imhist(heqb);
subplot(3,4,8)
plot(b,a,'r',d,c,'g',f,e,'b')

%histogram equalization for indexed image

[m, map] = imread('forest.tif');
hmap = histeq(m,map);
subplot(3,4,9)
imshow(m,map)
subplot(3,4,10)
imhist(m,map)
subplot(3,4,11)
imshow(m,hmap)
subplot(3,4,12)
imhist(m,hmap)
