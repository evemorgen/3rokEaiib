function ruchoma(nazwaObrazu)
    N = 20;
    a = 0.5;
    obraz = imread(nazwaObrazu);
    kopia = obraz;
    [X, Y] = size(obraz);
    tablica = zeros(1,20);
    
    m = obraz(1,1)/N;
    
    for i = 1:X
        for j = 1:Y
            m = sum(tablica);
            T = a*m;
            if obraz(i,j) > T
                kopia(i,j) = 255;
            else
                kopia(i,j) = 0;
            end
            tablica = [obraz(i,j)/N tablica(1:19)];
        end
    end
    
    figure;
    subplot(2,2,1);
    imshow(obraz);
    title('orygina?');
    
    subplot(2,2,2);
    imshow(kopia);
    title('binaryzowany');
    
    subplot(2,2,3:4);
    imhist(obraz);
    title('histogram');
end