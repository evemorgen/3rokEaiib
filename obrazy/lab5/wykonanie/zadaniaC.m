%% zadaniaC

%% 1. czy?cimy i wczytujemy
close all;
clearvars;
clc;

moon = imread('moon.bmp');

%% 2. maska L
M = [0 1 0; 1 -4 1; 0 1 0];

%% 3. normalizacja
M = M/9;

%% 4. konwolucja
konwolucjonowany = conv2(moon, M, 'same');
przeskalowany = konwolucjonowany + 128;
bezwzgledny = abs(konwolucjonowany);

subplot(2,5,1);
imshow(moon);
title('orygina?');

subplot(2,5,2);
imshow(konwolucjonowany, []);
title('konwolucjonowany');

subplot(2,5,3);
imshow(przeskalowany, []);
title('przeskalowany');

subplot(2,5,4);
imshow(bezwzgledny, []);
title('bezwzgl?dny');

subplot(2,5,5);
imshow(imadd(moon, uint8(konwolucjonowany)), []);
title('dodany');

%% 5. wbudowany laplacian
maska = fspecial('laplacian', 0.8);
konwolucjonowany2 = conv2(moon, maska, 'same');
przeskalowany2 = konwolucjonowany2 + 128;
bezwzgledny2 = abs(konwolucjonowany2);

subplot(2,5,6);
imshow(moon);
title('orygina?');

subplot(2,5,7);
imshow(konwolucjonowany2, []);
title('konwolucjonowany');

subplot(2,5,8);
imshow(przeskalowany2, []);
title('przeskalowany');

subplot(2,5,9);
imshow(bezwzgledny2, []);
title('bezwzgl?dny');

subplot(2,5,10);
imshow(imsubtract(moon, uint8(konwolucjonowany2)), []);
title('odj?ty');

