%% zadanie 1

%% pkt 4.
figure(1);
plot(kwadratowa);

%% pkt 5.
samolot = imread('jet.bmp');
figure(2);
imshow(samolot);

LUTsamolot = intlut(samolot, kwadratowa);
figure(3);
imshow(LUTsamolot);

%% pkt 8.

figure;
LUT('jet.bmp', kwadratowa);
figure;
LUT('jet.bmp', log);
figure;
LUT('jet.bmp', odwlog);
figure;
LUT('jet.bmp', odwrotna);
figure;
LUT('jet.bmp', pierwiastkowa);
figure;
LUT('jet.bmp', pila);
figure;
LUT('jet.bmp', wykladnicza);