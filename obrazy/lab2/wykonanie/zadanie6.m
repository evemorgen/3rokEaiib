% zadanie 6

%function nowyObraz = zadanie6(nazwa, skalaX, skalaY)
    skalaX = 5;
    skalaY = 5;
    nazwa = 'clock.bmp';
    close all;
    %% 2. Wczytaj i wy?wietl obraz

    obraz = double(imread(nazwa));
    figure;
    imshow(uint8(obraz));

    %% 3. Wsp??czynniki przekszta?cenia

    xNewScale = skalaX;
    yNewScale = skalaY;

    %% 4. Rozdzielczo?? nowego obrazu + nowy obraz

    [stareY, stareX] = size(obraz);
    noweX = floor(stareX * xNewScale);
    noweY = floor(stareY * yNewScale);

    nowyObraz = uint8(zeros(noweY, noweX));

    %% X. ustalenie kroku
    xStep = stareX / noweX;
    yStep = stareY / noweY;

    
    loadA = load('a1.mat');
    
    %% 5. przeforowanie przez obraz
    for pikselY = 0:(noweY - 1)
        for pikselX = 0:(noweX - 1)
      
            % 6. Wyznaczenie miejsca wok?? kt?rego b?dziemy bra? piksele
            % (?)
            staryPikselX = (pikselX * xStep);
            staryPikselY = (pikselY * yStep);
            
            
            %% 7. przekraczanie zakresu
            
            %% 8. zfloorowanie
            staryPikselXfloor = floor(staryPikselX) + 2;
            staryPikselYfloor = floor(staryPikselY) + 2;
            
            if staryPikselXfloor > floor(stareX) - 2;
                staryPikselXfloor = floor(stareX) - 2;
            end
            if staryPikselYfloor > floor(stareY) - 2;
                staryPikselYfloor = floor(stareY) - 2;
            end
            
            %% 9. A to tak na prawd? f(A) itd.
            A = obraz(staryPikselYfloor, staryPikselXfloor);
            B = obraz(staryPikselYfloor, staryPikselXfloor + 1);
            D = obraz(staryPikselYfloor + 1, staryPikselXfloor);
            C = obraz(staryPikselYfloor + 1, staryPikselXfloor + 1);
            
            Ay = (obraz(staryPikselYfloor, staryPikselXfloor + 1) - obraz(staryPikselYfloor, staryPikselXfloor-1))/2;
            By = (obraz(staryPikselYfloor, staryPikselXfloor + 1 + 1) - obraz(staryPikselYfloor, staryPikselXfloor + 1 - 1 ))/2;
            Dy = (obraz(staryPikselYfloor + 1, staryPikselXfloor + 1) - obraz(staryPikselYfloor + 1, staryPikselXfloor-1))/2;
            Cy = (obraz(staryPikselYfloor + 1, staryPikselXfloor + 1 + 1) - obraz(staryPikselYfloor + 1, staryPikselXfloor + 1 -1))/2;
            
            Ax = (obraz(staryPikselYfloor + 1, staryPikselXfloor) - obraz(staryPikselYfloor - 1, staryPikselXfloor))/2;
            Bx = (obraz(staryPikselYfloor + 1, staryPikselXfloor + 1) - obraz(staryPikselYfloor - 1, staryPikselXfloor + 1))/2;
            Dx = (obraz(staryPikselYfloor + 1 + 1, staryPikselXfloor) - obraz(staryPikselYfloor + 1 - 1, staryPikselXfloor))/2;
            Cx = (obraz(staryPikselYfloor + 1 + 1, staryPikselXfloor + 1) - obraz(staryPikselYfloor + 1 - 1, staryPikselXfloor + 1))/2;
            
            Axy = (obraz(staryPikselYfloor + 1, staryPikselXfloor + 1) - obraz(staryPikselYfloor - 1, staryPikselXfloor) - obraz(staryPikselYfloor, staryPikselXfloor - 1) + obraz(staryPikselYfloor, staryPikselXfloor))/4;
            Bxy = (obraz(staryPikselYfloor + 1, staryPikselXfloor + 1 + 1) - obraz(staryPikselYfloor - 1, staryPikselXfloor + 1) - obraz(staryPikselYfloor, staryPikselXfloor - 1 + 1) + obraz(staryPikselYfloor, staryPikselXfloor + 1))/4;
            Dxy = (obraz(staryPikselYfloor + 1 + 1, staryPikselXfloor + 1) - obraz(staryPikselYfloor - 1 + 1, staryPikselXfloor) - obraz(staryPikselYfloor + 1, staryPikselXfloor - 1) + obraz(staryPikselYfloor + 1, staryPikselXfloor))/4;
            Cxy = (obraz(staryPikselYfloor + 1 + 1, staryPikselXfloor + 1 + 1) - obraz(staryPikselYfloor - 1 + 1, staryPikselXfloor + 1) - obraz(staryPikselYfloor + 1, staryPikselXfloor - 1 + 1) + obraz(staryPikselYfloor + 1, staryPikselXfloor + 1))/4;
            
            x = [A ;B ;D ;C ;Ax ;Bx ;Dx ;Cx ;Ay ;By ;Dy ;Cy ;Axy ;Bxy ;Dxy ;Cxy];
            
            duzeA = loadA(1).A1;
            
            a = duzeA * x;
            
            %% 10. Zrobienie zakresu od 0 do 1
            xOdZeroDoJeden = staryPikselX - staryPikselXfloor;
            yOdZeroDoJeden = staryPikselY - staryPikselYfloor;
            
            sum = 0;
            
            for i = 0:3
                for j = 0:3
                    sum = sum + a(2*j+i+1)*((yOdZeroDoJeden)^i)*((xOdZeroDoJeden)^j);
                end
            end
            
            %% 11. wrzucenie do nowego obrazu
            nowyObraz(pikselY+1, pikselX+1) =  sum;
        end
    end
    
    %% 12. Pokazanie nowego obrazu, fuj.
    figure;
    imshow(nowyObraz, []);
%end