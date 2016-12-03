%% zadania D

%% 1. czy?cimy
close all;
clearvars;
clc;

%% 2. wczytujemy kalkulator
calc = imread('calculator.bmp');

X = 2;
Y = 1;

subplot(1, 1, 1);
imshow(calc);
title('orygina?');

%% 3. erozja i rekonstrukcja
po_erozji = imerode(calc, ones(1,71));
po_rekonstrukcji = imreconstruct(po_erozji, calc);
po_otwarciu = imopen(po_erozji, ones(1,71));
%% 4. odjeie i tophat
po_odjeciu = imabsdiff(calc, po_rekonstrukcji);
po_tophacie = imtophat(calc, ones(1,71));
%% 5. druga erozja i rekonstrukcja
po_drugiej_erozji = imerode(po_odjeciu, ones(1,11));
po_drugiej_rekonstrukcji = imreconstruct(po_drugiej_erozji, po_odjeciu);
%% 6. dylatacja
po_dylatacji = imdilate(po_drugiej_rekonstrukcji, ones(1,23));
po_trzeciej_rekonstrukcji = imreconstruct(min(po_dylatacji,po_drugiej_rekonstrukcji), po_drugiej_rekonstrukcji);

figure;
subplot(Y, X, 1);
imshow(po_rekonstrukcji);
title('rekonstrukcja');

subplot(Y, X, 2);
imshow(po_otwarciu);
title('otwarcie');

figure;
subplot(Y, X, 1);
imshow(po_odjeciu);
title('imsubstract');

subplot(Y, X, 2);
imshow(po_tophacie);
title('tophat');

figure;
subplot(Y,X,1);
imshow(po_drugiej_erozji);
title('druga erozja');

subplot(Y,X,2);
imshow(po_drugiej_rekonstrukcji);
title('druga rekonstrukcja');

figure;
subplot(Y,X,1);
imshow(po_dylatacji);
title('dylatacja');

subplot(Y,X,2);
imshow(po_trzeciej_rekonstrukcji);
title('trzecie rekonstrukcja');




