%wykonanie zadania A
%otwarcie -> dylatacja
ertka = imread('ertka.bmp');
wyspa = imread('wyspa.bmp');
kolka = imread('kolka.bmp');
hom = imread('hom.bmp');
buzka = imread('buzka.bmp');

[~,~,~,otw,~] = zadaniaA(ertka, 1);
zadaniaA(otw, 1);

figure;
imshow(hom);
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

hom_bwhitmiss = bwhitmiss(hom, SE1, SE2);
figure;
imshow(hom_bwhitmiss);

figure;
zadaniaA(buzka, 1, true);