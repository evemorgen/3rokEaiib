%% zadania C

%% 1. czy?cimy

clc;
close all;
clearvars;

obraz = imread('bart.bmp');

%zadaniaA('bart.bmp', 5); %nie
%zadaniaA('bart.bmp', 107); %nie
%zadaniaA('bart.bmp', 138); %prawie
%zadaniaA('bart.bmp', 160); %prawie
zadaniaA('bart.bmp', 179); %idealnie
%zadaniaA('bart.bmp', 201); %sama g?owa
%zadaniaA('bart.bmp', 237); %nie

obrazBW = obraz > 170 & obraz < 185;
obrazBW = uint8(obrazBW);
figure;
imshow(obrazBW, []);