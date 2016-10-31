%% 1.1. wywalenie wszystkiego
clearvars;
close all;
clc;

%% 1.2. wczytanie wszystkich Len
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

%% 1.3. 8 subplotów
subplot(4,2,1);
imshow(lena1);
title('lena1');
subplot(4,2,2);
imhist(lena1, 256);
title('histogram lena1');

subplot(4,2,3);
imshow(lena2);
title('lena2');
subplot(4,2,4);
imhist(lena2, 256);
title('histogram lena2');

subplot(4,2,5);
imshow(lena3);
title('lena3');
subplot(4,2,6);
imhist(lena3, 256);
title('histogram lena3');

subplot(4,2,7);
imshow(lena4);
title('lena4');
subplot(4,2,8);
imhist(lena4, 256);
title('histogram lena4');
