close all;
clearvars;
clc;

img = imread('fingerprint.bmp');
img2 = bwmorph(img,'thin',2);
img3 = bwmorph(img,'thin',3);
img4 = bwmorph(img,'thin',Inf);

figure;
subplot(2,2,1);
imshow(img);

subplot(2,2,2);
imshow(img2);

subplot(2,2,3);
imshow(img3);

subplot(2,2,4);
imshow(img4);

img = imread('kosc.bmp');
img2 = bwmorph(img,'skel',Inf);

figure;
subplot(1,2,1);
imshow(img);

subplot(1,2,2);
imshow(img2);

text = imread('text.bmp');
textPion = imopen(text,ones(51,1));
textErode = imerode(text,ones(51,1));
textRec = imreconstruct(textErode, text);
textFill = imfill(text,'holes');
textClear = imclearborder(text);

figure;
subplot(2,3,1);
imshow(text);

subplot(2,3,2);
imshow(textPion);

subplot(2,3,3);
imshow(textErode);

subplot(2,3,4);
imshow(textRec);

subplot(2,3,5);
imshow(textFill);

subplot(2,3,6);
imshow(textClear);
