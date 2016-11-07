%% zadania A

%% 1. czyścimy
close all;
clearvars;
clc;

nazwaPliku = 'plansza.bmp';
plotX = 3;
plotY = 1;

%% 2. wczytujemy tifa
plansza = imread(nazwaPliku);

%% 3. i 4. konwolucja
maska = fspecial('average', [3 3]);
konwolucjonowany = uint8(conv2(plansza, maska));


subplot(plotY, plotX, 1);
imshow(plansza);
title('oryginał');

subplot(plotY, plotX, 2);
imshow(konwolucjonowany);
title('konwolucja');

diff = imabsdiff(plansza, konwolucjonowany(1:500, 1:500));
%diff = imabsdiff(plansza, konwolucjonowany(1:512, 1:512));

subplot(plotY, plotX, 3);
imshow(diff, []);
title('imabsdiff');

%% 6. różne uśrednienia

maska1 = fspecial('average', [3 3]);
maska2 = fspecial('average', [5 5]);
maska3 = fspecial('average', [9 9]);
maska4 = fspecial('average', [15 15]);
maska5 = fspecial('average', [35 35]);

konwolucjonowany1 = uint8(conv2(plansza, maska1));
konwolucjonowany2 = uint8(conv2(plansza, maska2));
konwolucjonowany3 = uint8(conv2(plansza, maska3));
konwolucjonowany4 = uint8(conv2(plansza, maska4));
konwolucjonowany5 = uint8(conv2(plansza, maska5));

figure;
plotX = 2;
plotY = 3;

subplot(plotY, plotX, 1:2);
imshow(konwolucjonowany1);
title('konwolucja 3x3');

subplot(plotY, plotX, 3);
imshow(konwolucjonowany2);
title('konwolucja 5x5');

subplot(plotY, plotX, 4);
imshow(konwolucjonowany3);
title('konwolucja 9x9');

subplot(plotY, plotX, 5);
imshow(konwolucjonowany4);
title('konwolucja 15x15');

subplot(plotY, plotX, 6);
imshow(konwolucjonowany5);
title('konwolucja 35x35');

%% 8. to samo na lenie
figure;
nazwaPliku = 'lena.bmp';
plotX = 3;
plotY = 1;

plansza = imread(nazwaPliku);

M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));
maska = M;
konwolucjonowany = uint8(conv2(plansza, maska));


subplot(plotY, plotX, 1);
imshow(plansza);
title('oryginał');

subplot(plotY, plotX, 2);
imshow(konwolucjonowany);
title('konwolucja własna maska');

diff = imabsdiff(plansza, konwolucjonowany(1:512, 1:512));

subplot(plotY, plotX, 3);
imshow(diff, []);
title('imabsdiff');

%% 9. pan Gauss
figure;
plotX = 3;
plotY = 2;
maska1 = fspecial('gaussian', [5 5], 0.5);
maska2 = fspecial('gaussian', [5 5], 7);
maska3 = fspecial('gaussian', [5 5], 0.8);

konwolucjonowany1 = uint8(conv2(plansza, maska1));
konwolucjonowany2 = uint8(conv2(plansza, maska2));
konwolucjonowany3 = uint8(conv2(plansza, maska3));

subplot(plotY, plotX, 1);
imshow(konwolucjonowany1);
title('sigma 0.5');


subplot(plotY, plotX, 2);
imshow(konwolucjonowany2);
title('sigma 7');

subplot(plotY, plotX, 3);
imshow(konwolucjonowany3);
title('sigma 0.8');

subplot(plotY, plotX, 4);
mesh(maska1);
title('maska1');

subplot(plotY, plotX, 5);
mesh(maska2);
title('maska1');

subplot(plotY, plotX, 6);
mesh(maska3);
title('maska1');

