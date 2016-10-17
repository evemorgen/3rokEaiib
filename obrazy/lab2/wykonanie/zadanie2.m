% zadanie 2
function nowyObraz = zadanie2(nazwa, skalaX, skalaY)
   
    close all;
    %% 2. Wczytaj i wy?wietl obraz

    obraz = double(imread(nazwa));
    figure;
    imshow(uint8(obraz));

    %% 3. Wsp??czynniki przekszta?cenia

    xNewScale = skalaX;
    yNewScale = skalaY;

    %% 4. Rozdzielczo?? nowego obrazu + nowy obraz

    [stareX, stareY] = size(obraz);
    noweX = floor(stareX * xNewScale);
    noweY = floor(stareY * yNewScale);

    nowyObraz = uint8(zeros(noweY, noweX));

    %% X. ustalenie kroku
    xStep = stareX / noweX;
    yStep = stareY / noweY;

    
    %% 5. przeforowanie przez obraz
    for pikselY = 0:(noweY - 1)
        for pikselX = 0:(noweX - 1)
      
            % 6. Wyznaczenie miejsca wok?? kt?rego b?dziemy bra? piksele
            % (?)
            staryPikselX = (pikselX * xStep);
            staryPikselY = (pikselY * yStep);
            
            
            %% 7. przekraczanie zakresu
            if staryPikselX > stareX - 2;
                staryPikselX = stareX - 2;
            end
            if staryPikselY > stareY - 2;
                staryPikselY = stareY - 2;
            end
            
            %% 8. zfloorowanie
            staryPikselXfloor = floor(staryPikselX);
            staryPikselYfloor = floor(staryPikselY);
            
            %% 9. A to tak na prawd? f(A) itd.
            A = obraz(staryPikselYfloor + 1, staryPikselXfloor + 1);
            B = obraz(staryPikselYfloor + 1, staryPikselXfloor + 2);
            C = obraz(staryPikselYfloor + 2, staryPikselXfloor + 2);
            D = obraz(staryPikselYfloor + 2, staryPikselXfloor + 1);
            
            %% 10. Zrobienie zakresu od 0 do 1
            xOdZeroDoJeden = staryPikselX - staryPikselXfloor;
            yOdZeroDoJeden = staryPikselY - staryPikselYfloor;
            
            %% 11. wrzucenie do nowego obrazu
            nowyObraz(pikselY+1, pikselX+1) = A*(1 - xOdZeroDoJeden)*(1 - yOdZeroDoJeden) + B*xOdZeroDoJeden*(1 - yOdZeroDoJeden) + C*xOdZeroDoJeden*yOdZeroDoJeden + D*(1 - xOdZeroDoJeden)*yOdZeroDoJeden;
        end
    end
    
    %% 12. Pokazanie nowego obrazu, fuj.
    figure;
    imshow(uint8(nowyObraz));
end