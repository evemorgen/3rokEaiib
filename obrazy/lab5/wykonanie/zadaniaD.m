%% zadania D - Gradienty

%% 1. czy?cimy i wczytujemy
close all;
clearvars;
clc;

kw = imread('kw.bmp');
%kw = imread('jet.bmp');
load 'maskiPP';

konwolucjonowany = conv2(kw, R1, 'same');
przeskalowany = konwolucjonowany + 128;
bezwzgledny = abs(konwolucjonowany);

subplot(2,5,1);
imshow(kw);
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
imshow(imadd(kw, uint8(konwolucjonowany)), []);
title('dodany');

konwolucjonowany2 = conv2(kw, R2, 'same');
przeskalowany2 = konwolucjonowany2 + 128;
bezwzgledny2 = abs(konwolucjonowany2);

subplot(2,5,6);
imshow(kw);
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
imshow(imsubtract(kw, uint8(konwolucjonowany2)), []);
title('odj?ty');


%% 2 Perwitt
figure;
konwolucjonowany = conv2(kw, P1, 'same');
przeskalowany = konwolucjonowany + 128;
bezwzgledny = abs(konwolucjonowany);

subplot(2,5,1);
imshow(kw);
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
imshow(imadd(kw, uint8(konwolucjonowany)), []);
title('dodany');

konwolucjonowany2 = conv2(kw, P1, 'same');
przeskalowany2 = konwolucjonowany2 + 128;
bezwzgledny2 = abs(konwolucjonowany2);

subplot(2,5,6);
imshow(kw);
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
imshow(imsubtract(kw, uint8(konwolucjonowany2)), []);
title('odj?ty');


%% 3. Sobel
figure;
konwolucjonowany = conv2(kw, S1, 'same');
przeskalowany = konwolucjonowany + 128;
bezwzgledny = abs(konwolucjonowany);

subplot(2,5,1);
imshow(kw);
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
imshow(imadd(kw, uint8(konwolucjonowany)), []);
title('dodany');

konwolucjonowany2 = conv2(kw, S2, 'same');
przeskalowany2 = konwolucjonowany2 + 128;
bezwzgledny2 = abs(konwolucjonowany2);

subplot(2,5,6);
imshow(kw);
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
imshow(imsubtract(kw, uint8(konwolucjonowany2)), []);
title('odj?ty');

%% 4 i 5. kombinowany
konwolucjonowany1 = conv2(kw, S1, 'same');
konwolucjonowany2 = conv2(kw, S2, 'same');
wyjsciowy1 = sqrt(konwolucjonowany1.^2 + konwolucjonowany2.^2);
wyjsciowy2 = abs(konwolucjonowany1) + abs(konwolucjonowany2);

figure;
subplot(1,3,1);
imshow(kw);
title('orygina?');

subplot(1,3,2);
imshow(wyjsciowy1);
title('kombinowany normalny');

subplot(1,3,3);
imshow(wyjsciowy2);
title('kombinowany modu?');