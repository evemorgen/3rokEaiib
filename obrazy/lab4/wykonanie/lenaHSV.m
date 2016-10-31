%% zabawy z HSV (nie myli? z HIV)

function lenaHSV(nazwa)
    %% 1. Wczytaj leny czy inne jeziora
    lena = imread(nazwa);
    x = 3;
    y = 4;
    
    %% 2. Konwersja leny do hsv
    figure;
    lenaHSV = rgb2hsv(lena);
    subplot(y,x,1:3);
    imshow(lena);

    %% 3. Rozdzielamy na sk?adowe
    H = lenaHSV(:,:,1);
    S = lenaHSV(:,:,2);
    V = lenaHSV(:,:,3);

    %% 4. Wy?wietlamy histogramy i sk?adowe
    subplot(y,x,4);
    imshow(H);
    subplot(y,x,5);
    imshow(S);
    subplot(y,x,6);
    imshow(V);

    subplot(y,x,7);
    imhist(H);
    subplot(y,x,8);
    imhist(S);
    subplot(y,x,9);
    imhist(V);
    
    %% 5. Wyr?wnujemy jasno??
    wyrownaneV = histeq(V, 256);
    lenaHSV(:,:,3) = wyrownaneV;
    
    %% 6. Konwertujemy do RGB
    lenaRGB = hsv2rgb(lenaHSV);
    
    %% 7. Wy?wietlamy
    subplot(y,x,10:12);
    imshow(lenaRGB);
end

