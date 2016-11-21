%% Standard deviation

% Autor: Tomasz Kryjak
% Laboratorium Biocybernetyki AGH
% Utworzono            : 07.10.2009
% Ostatnia modyfikajca : 07.10.2009

function sd = stddevLT(x,y,W2,I,M,X,Y)

% x - wsp x punktu centralnego
% y - wsp y punktu centralnego
% W2 - rozmiar maski 1/2
% I - obrazkek
% M - srednia dla piksela 
% X - rozmiar X obrazka
% Y - rozmiar Y obrazka

    % petla po otoczeniu
    
    il = 0.0;    % ilosc sumowanych elementow
    suma = double(0);  % suma pikseli z otoczenia
    
   
    
    for i= -W2:1:W2
        for j= -W2:1:W2
            
            % sprawdzanie warunkow - czy piksel jest w otoczeniu
            
            if ( (i+x) >= 1 && (i+x) <= X && (j+y) >= 1 && (j+y) <= Y )
                il = il +1;
                %suma = suma + ( (double(I(i+x,j+y))^2) - double(M^2) );
                suma = suma + ( (double(I(i+x,j+y))-double(M))^2 );
            
            end
            
        end
    end
    
    sd = sqrt( suma / il);
    %sd = suma / il;


end