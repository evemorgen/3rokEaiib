%% Mediana dla obrazu kolorowego

% Autor: Tomasz Kryjak
% Laboratorium Biocybernetyki AGH
% Utworzono            : 18.08.2009
% Ostatnia modyfikajca : 04.09.2009

clear all;
close all;

%% Wczytanie obrazu
iI=imread('lenaRGB.bmp');

%% Ustalenie rozmiaru maski
rozmiarMaski =3;


%% Obliczenie parametrow
[X Y Z] = size(iI);                  % rozmiary obrazka
oI=iI;                               % przekopiowanie oryginalu (rozwiazanie problemu brzegowego + alokacja pamieci) 
otocz = floor(rozmiarMaski/2);       % obliczenie parametru otoczenia (jako polowy rozmiru maski)

%% Petla po wszystkich pikselach obrazu
for i=1:X
    for j=1:Y
              
        if ( i-otocz > 1 && j-otocz> 0 && i+otocz<X && j+otocz<Y ) % czy mozna wyznaczyc element strukturalny ? - czy nie na brzegu

            % Wynzaczenie otoczenia
            otoczenie = double(iI(i-otocz:i+otocz,j-otocz:j+otocz,:));
            % Konwersja z macierzy na wektor
            otoczenie =  reshape(otoczenie,rozmiarMaski*rozmiarMaski,1,3); 
            % Alokacja macierzy odleglosci
            odlegosci = zeros(rozmiarMaski*rozmiarMaski,rozmiarMaski*rozmiarMaski);
            
            % Petla po otoczeniu
            for k = 1:rozmiarMaski*rozmiarMaski-1
                
                % Skladowe analizowanego piksla
                RR = otoczenie(k,1);
                GG = otoczenie(k,2);
                BB = otoczenie(k,3);
                
                % Wynzacz odleglosci do pikseli z otoczenia i wynik zapisz
                % w macierzy
                for l = k+1:rozmiarMaski*rozmiarMaski
                   odlegosci(k,l) = sqrt(((RR-otoczenie(l,1))^2+(GG-otoczenie(l,2))^2+(BB-otoczenie(l,3))^2) );
                   odlegosci(l,k) = odlegosci(k,l);
                end
            end
            
            % Wynczacznie parametru odleglosci do sasiednich pikseli dla
            % kazdego z pikseli (sumowanie macierzy odleglosci)
            odl = sum(odlegosci);
            
            % Wyznaczanie minimalnej odleglosci
            [minV posMin] = min(odl);
            
            % Przypisanie wartosci nowego piksela
            oI(i,j,:)= otoczenie(posMin,:);
        end
        
    end
end


%% Wyswietlenie wyników
figure(1);
subplot(1,3,1);
imshow(iI);
title('Obraz oryginalny');
subplot(1,3,2);
imshow(oI);
title('Obraz po filtracji medianowej');
subplot(1,3,3);
imshow(imabsdiff(iI,oI),[]);
title('Modul z roznicy obrazow');

