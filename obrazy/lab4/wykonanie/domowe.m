%% Domowe

%% 0. czy?cimy
clearvars;
clc;
close all;

%% 1. Wczytujemy i liczymy histogram
jet = imread('jet.bmp');
[counts,x] = imhist(jet);

%% 2. Zaokr?glona ?rednia z ca?ego obrazu
lm = round(mean(jet(:)));

%% 3. Dwa histogramy, normalizacja i skumulowane
H1 = counts(1:lm);
X1 = 1:lm;
H2 = counts(lm:length(counts)-1);
X2 = 1:(length(counts) - lm);

H1 = H1/sum(H1);
H2 = H2/sum(H2);

C1 = cumsum(H1);
C2 = cumsum(H2);

%% 4.Tworzymy luta
C1n = (lm)*C1;
C2n = lm+1 + (255 - lm + 1)*C2;

lut = uint8(transpose([C1n; C2n]));

%% 5. lutujemy, wy?wietlamy
zlutowany = intlut(uint8(jet), lut);
subplot(2,2,1);
imshow(jet);
title('normalny jet');
subplot(2,2,2);
imshow(zlutowany);
title('BBHE jet');
subplot(2,2,3);
imhist(jet);
title('histogram normalnego jeta');
subplot(2,2,4);
imhist(zlutowany);
title('histogram BBHE jeta');