% zadanie 1
function nowyObraz = zadanie1(nazwa, skalaX, skalaY)
    %% 2. Wczytaj i wy?wietl parrot.bmp

    obraz = imread(nazwa);
    imshow(obraz);

    %% 3. Wsp??czynniki przekszta?cenia

    xNewScale = skalaX;
    yNewScale = skalaY;

    %% 4. Rozdzielczo?? nowego obrazu + nowy obraz

    [stareX, stareY] = size(obraz);
    noweX = floor(stareX * xNewScale);
    noweY = floor(stareY * yNewScale);

    nowyObraz = uint8(zeros(noweY, noweX));

    %% 5. przeforowanie przez obraz

    xStep = stareX / noweX;
    yStep = stareY / noweY;

    for pikselY = 0:(noweY - 1)
        for pikselX = 0:(noweX - 1)

    %% 6. najbli?szy s?siad        
            staryPikselX = round(pikselX * xStep);
            staryPikselY = round(pikselY * yStep);

    %% 7. przekraczanie zakresu
            if staryPikselX > stareX - 1;
                staryPikselX = stareX - 1;
            end
            if staryPikselY > stareY - 1;
                staryPikselY = stareY - 1;
            end
            nowyObraz(pikselY+1, pikselX+1) = obraz(staryPikselY+1, staryPikselX+1);
        end
    end
    figure;
    imshow(nowyObraz);
end
