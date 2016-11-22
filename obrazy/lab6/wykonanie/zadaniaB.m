%% zadania B
function zadaniaB(obrazek, n, rozmiarOkna, sauvol)

    k = 0.15;
    R = 128;

    if nargin < 4
        sauvol = false;
        figure('name', 'tylko ?rednia');
    else
        figure('name', 'Sauvoli');
    end

    %% 2. czytamy ry?, obraz ry?u, kopie ry?u
    rice = imread(obrazek);
    riceBW = rice;
    [X, Y] = size(rice);

    %% 3. forujemy
    for i = 1:X
        for j = 1:Y
            srednia = meanLT(i,j,rozmiarOkna,rice,X,Y);
            if sauvol == true
                odchylenie = stddevLT(i,j,rozmiarOkna,rice,srednia,X,Y);
                T = srednia*(1 - k*(odchylenie/R - 1));
                if T < rice(i,j)
                    riceBW(i,j) = 255;
                else
                    riceBW(i,j) = 0;
                end
            else
                if srednia < rice(i,j)
                    riceBW(i,j) = 255;
                else
                    riceBW(i,j) = 0;
                end
            end
        end
    end

    subplot(2,1,1);
    imshow(rice);
    title('orygina?');

    subplot(2,1,2);
    imshow(riceBW);
    title('binaryzowany');
end