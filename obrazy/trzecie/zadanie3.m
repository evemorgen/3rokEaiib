%% zadanie 3

%% pkt 1.
clearvars;
close all;
clc;

kolo = boolean(imread('kolo.bmp'));
kwadrat = boolean(imread('kwadrat.bmp'));

figure;
imshow(kolo);
figure;
imshow(kwadrat);

or = kolo | kwadrat;
and = kolo & kwadrat;
ksor = xor(kolo, kwadrat);
figure;
imshow(or);
figure;
imshow(and);
figure;
imshow(ksor);
