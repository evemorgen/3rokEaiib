%% zadania A

%% 1. czy??cimy
close all;
clearvars;
clc;

Iks = 2;
Igrek = 1;
prog = 40;
nS = 0;
mV = 0;

%% 2. wczytujemy, wy??wietlamy
obraz = imread('knee.png');
obraz = double(obraz);

imshow(obraz, []);

[W, H] = size(obraz);

[Y, X] = ginput(1);
%Y = 354,
%X = 470;
X = floor(X);
Y = floor(Y);

figure;
%% 3. implementacja stosu
visited = zeros(size(obraz));
segmented = zeros(size(obraz));
stos = zeros(10000,2);
istos = 1;

%% 4. odk??adanie
stos(istos, 1) = X;
stos(istos, 2) = Y;

visited(X,Y) = 1;
segmented(X,Y) = obraz(Y,X);

%% 5. while loop
licznik = 0;

while istos > 0
    wspX = stos(istos, 1);
    wspY = stos(istos, 2);
    istos = istos - 1;
    
    nS = nS + 1;
    mV = (mV*(nS - 1) + obraz(wspX, wspY))/nS;
    jasnosc = mV;
    %jasnosc = obraz(wspY, wspX);
    if wspX > 1 && wspX < W && wspY > 1 && wspY < H
        for i = wspX-1:wspX+1
            for j = wspY-1:wspY+1
                if abs(obraz(i, j) - mV) < prog && visited(i, j) == 0
                    segmented(i, j) = obraz(i, j);
                    istos = istos + 1;
                    stos(istos, 1) = i;
                    stos(istos, 2) = j;
                end
                visited(i, j) = 1;
            end
        end
    end
    licznik = licznik + 1;
    if(mod(licznik,800)==0)
        imshow(segmented,[]);
    end
end
imshow(segmented,[]);