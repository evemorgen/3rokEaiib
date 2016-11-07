%% zadania B

%% 1. czyścimy
close all;
clearvars;
clc;

nazwaPliku = 'lenaSzum.bmp';
plotX = 3;
plotY = 1;

plansza = imread(nazwaPliku);
konwolucjonowany = uint8(medfilt2(plansza));

subplot(plotY, plotX, 1);
imshow(plansza);
title('oryginał');

subplot(plotY, plotX, 2);
imshow(konwolucjonowany);
title('konwolucja');

diff = imabsdiff(plansza, konwolucjonowany(1:512, 1:512));

subplot(plotY, plotX, 3);
imshow(diff, []);
title('imabsdiff');

%% 2. lena mediana i średnia

nazwaPliku = 'lena.bmp';
plotX = 3;
plotY = 2;

plansza = imread(nazwaPliku);
medianowany = uint8(medfilt2(plansza));
maska = fspecial('average', [3 3]);
konwolucjonowany = uint8(conv2(plansza, maska));

subplot(plotY, plotX, 1);
imshow(plansza);
title('oryginał');

subplot(plotY, plotX, 2);
imshow(medianowany);
title('mediana');

diff = imabsdiff(plansza, medianowany(1:512, 1:512));

subplot(plotY, plotX, 3);
imshow(diff, []);
title('imabsdiff mediana');

subplot(plotY, plotX, 4);
imshow(plansza);
title('oryginał');

subplot(plotY, plotX, 5);
imshow(konwolucjonowany);
title('konwolucja');

diff = imabsdiff(plansza, konwolucjonowany(1:512, 1:512));

subplot(plotY, plotX, 6);
imshow(diff, []);
title('imabsdiff konwolucja');

%% 3. ciekawa posteryzacja
figure;
nazwaPliku = 'lena.bmp';
plotX = 5;
plotY = 2;

plansza = imread(nazwaPliku);
konwolucjonowany = medfilt2(plansza, [5 5]);

for i=1:10
    konwolucjonowany = medfilt2(konwolucjonowany, [5 5]);
    diff = imabsdiff(plansza, konwolucjonowany(1:512, 1:512));
    subplot(plotY,plotX, i);
    imshow(diff,[]);
end

plotX = 3;
plotY = 1;

figure;
subplot(plotY, plotX, 1);
imshow(plansza);
title('oryginał');

subplot(plotY, plotX, 2);
imshow(konwolucjonowany);
title('konwolucja');

diff = imabsdiff(plansza, konwolucjonowany(1:512, 1:512));

subplot(plotY, plotX, 3);
imshow(diff, []);
title('imabsdiff');


%% 7. odpalamy
run('median3dRGB');
