% 1. Czyścimy
close all;
clearvars;
clc;

global prog1;
global prog2;

prog1 = 8;
prog2 = 8;

umbrella = imread('umbrealla.png');
imshow(umbrella);

haesv = double(rgb2hsv(umbrella));

