%% Wyznaczenie progu binaryzacji metoda ENTROPY YEN

% Autor: Tomasz Kryjak
% Laboratorium Biocybernetyki AGH
% Utworzono            : 07.10.2009
% Ostatnia modyfikajca : 07.10.2009

function Topt = entropyYen(obraz)


    % Histogram
    [H x] = imhist(obraz);

    % Gestosc prawdopodobienstwa
    p = H / sum(H);

    % Histogram skumulowany (dystrybuanta)
    P = cumsum(p);

    Hf = zeros(1,256);
    Hb = zeros(1,256);

% Obliczanie Hf i Hb
    for T=1:1:256

        suma = 0;
        for i=1:1:T
            z = (p(i)/P(T))^2;
            
           
                   
            
            % Dystrybuanta = 0 -> Entropia nieskonczona
            if ( p(T) == 0 )
                z = Inf;
            end
            suma = suma + z;
        end
        Hf(T) = -1*log(suma);

        suma = 0;
        for i=T+1:1:256
            z = (p(i)/(1-P(T)))^2;
            
          
            % Dystrybuanta = 0 -> Entropia nieskonczona
            if ( p(T) == 1 )
                z = Inf;
            end
            
            suma = suma + z;
        end
        Hb(T) = -1*log(suma);

    end

    HH = Hf + Hb;
    [v Topt] = max(HH);
    
    % Zabezpieczenie przed Inf
    while ( v == Inf )
        HH(Topt) = -Inf;
        [v Topt] = max(HH);
    end
    
    % Korekcja o 1
    Topt = Topt-1;
end