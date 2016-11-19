%% domowe

%% 1. czy?cimy
clc;
clearvars;
close all;


obrazName = 'tekstReczny.png';
obraz = imread(obrazName);

zadaniaA(obrazName, (255*graythresh(obraz)));
zadaniaA(obrazName, 100);
ruchoma(obrazName);