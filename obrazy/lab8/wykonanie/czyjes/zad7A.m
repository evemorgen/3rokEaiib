close all;
clearvars;
clc;

img = imread('ertka.bmp');
img1 = imerode(img, strel('square',3));
img2 = imerode(img, strel('line',5,45));
img3 = imerode(img, strel('disk',5,4));

figure;
subplot(2,2,1);
imshow(img);

subplot(2,2,2);
imshow(img1);

subplot(2,2,3);
imshow(img2);

subplot(2,2,4);
imshow(img3);


img1 = imerode(img, strel('square',3));
img2 = imerode(img1, strel('square',3));
img3 = imerode(img2, strel('square',3));

figure;
subplot(2,2,1);
imshow(img);

subplot(2,2,2);
imshow(img1);

subplot(2,2,3);
imshow(img2);

subplot(2,2,4);
imshow(img3);

buzka = imread('buzka.bmp');

figure;
subplot(1,2,1);
imshow(buzka);
maska = [0 1; 1 0];
buzka1 = imerode(buzka, maska);
subplot(1,2,2);
imshow(buzka1);

img = imread('kolka.bmp');
img1 = imerode(img, strel('square',3));
img2 = imdilate(img, strel('square',3));
img3 = imopen(img, strel('square',3));
img4 = imclose(img, strel('square', 3));

figure;
subplot(2,2,1);
imshow(img1);

subplot(2,2,2);
imshow(img2);

subplot(2,2,3);
imshow(img3);

subplot(2,2,4);
imshow(img4);

hom = imread('hom.bmp');

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

homBWHM = bwhitmiss(hom,SE1,SE2);

figure;
subplot(1,2,1);
imshow(hom);

subplot(1,2,2);
imshow(homBWHM);

img = imread('ertka.bmp');
img1 = imclose(img, strel('square',3));
img2 = imopen(img1, strel('square',3));

figure;
imshow(img2);