%bwlabel counts objects
clear
im = imread('coins.png');
bw = im2bw(im);

new = imopen(bw,strel('disk',2));
[bl, n] = bwlabel(new);
imshow(bl);title(n)

%%fixing image (pre-processing: filtering, binarization and morphological operations)
%	(segmantion: isolation of objects) 
clear
close all

im = imread('rice.png');
figure
imshow(im)
new = imopen(im,strel('disk',15));
figure
imshow(new)

out = im - new + 70;
figure
imshow(out)

bw = im2bw(out);
figure
imshow(bw)

new2 = imerode(bw,strel('disk',2));
figure
imshow(new2)

[bl, n]= bwlabel(new2);
figure
imshow(bl);title(n)

%%Features extraction (regionprops)
clear
close all

BW = imread('coins.png');
bw1=im2bw(BW);

s = regionprops(bw1, 'centroid', 'Image');
centroids = cat(1, s.Centroid);
imshow(bw1)
hold on
plot(centroids(:,1), centroids(:,2), 'b*')
hold off

%%
clear
close all
BW = imread('circles.png');

%bw1=im2bw(BW);
[bwl, n]=bwlabel(BW);
s  = regionprops(bwl,  'ConvexImage');
for i=1:1
   subplot(2,2,i), imshow(s(i).ConvexImage), title(i) 
end

%%Features extraction and classification
clear
close all

im=imread('suits.jpg');
bw=im2bw(im,graythresh(im));
bw=~bw;
figure,imshow(bw);

[bwL,n1]=bwlabel(bw);
figure,imshow(label2rgb(bwL));

s=regionprops(bwL,'Solidity','Image');

s(1).mClass='spades';
s(2).mClass='clubs';
s(3).mClass='hearts';
s(4).mClass='diamonds';

figure
for nn=1:n1
   subplot(2,2,nn), imshow(s(nn).Image), title(s(nn).mClass) 
end

im1=imread('findsuits.jpg');

bw1=im2bw(im1,graythresh(im1));
bw1=~bw1;
figure,imshow(bw1)
[bwL1,n]=bwlabel(bw1);

s_test=regionprops(bwL1,'Solidity','image');
figure
for i=1:n
  d=abs([s.Solidity]-s_test(i).Solidity);
  [d,ii]=min(d);
  s_test(i).mClass=s(ii).mClass;
  subplot(2,4,i), imshow(s_test(i).Image), title(s_test(i).mClass);
end