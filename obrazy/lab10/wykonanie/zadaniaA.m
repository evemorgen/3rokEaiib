%% zadania A

%% 1. czyścimy
close all;
clearvars;
clc;
Iks = 2;
Igrek = 1;
prog = 20;
nS = 1;
mV = 0;

%% 2. wczytujemy, wyświetlamy
obraz = imread('knee.png');
obraz = double(obraz);
subplot(Igrek,Iks,1);
imshow(obraz, []);

[Y, X] = ginput(1);
%Y = 354,
%X = 470;
X = floor(X);
Y = floor(Y);

%% 3. implementacja stosu
visited = zeros(size(obraz));
segmented = zeros(size(obraz));
stos = zeros(10000,2);
istos = 1;

%% 4. odkładanie
stos(istos, 1) = X;
stos(istos, 2) = Y;

visited(Y,X) = 1;
segmented(Y,X) = obraz(Y,X);

%% 5. while loop

while istos > 0
    wspX = stos(istos, 1);
    wspY = stos(istos, 2);
    istos = istos - 1;
    %nS = nS + 1;
    %mV = (mV + obraz(wspY, wspX))/nS;
    %jasnosc = mV;
    jasnosc = obraz(wspY, wspX);
    for i = 1:3
        for j = 1:3
            if abs(jasnosc - obraz(wspY - 1 + i, wspX - 1 + j)) < prog && visited(wspY - 1 + i, wspX - 1 + j) == 0
                segmented(wspY - 1 + i, wspX - 1 + j) = obraz(wspY - 1 + i, wspX - 1 + j);
                istos = istos + 1;
                stos(istos, 1) = wspX - 1 + j;
                stos(istos, 2) = wspY - 1 + i;
            end
            visited(wspY - 1 + i, wspX - 1 + j) = 1;
        end
    end
end

subplot(Igrek,Iks,2);
imshow(segmented, []);