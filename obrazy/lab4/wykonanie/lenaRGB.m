function lenaRGB(nazwa)
    %% 1. Czy?cimy
    x = 4;
    y = 3;
    figure;

    %% 2. Wczytujemy kolorow? len?
    lena = imread(nazwa);
    subplot(y,x,1:2);
    imshow(lena);
    title('orygina?');

    %% 3. Robimy sk?adowe
    lenaR = lena(:,:,1);
    lenaG = lena(:,:,2);
    lenaB = lena(:,:,3);

    %% 4. Wy?wietlamy leny + histogramy
    subplot(y,x,5);
    imshow(lenaR);
    title('lenaR');
    subplot(y,x,6:7);
    imshow(lenaG);
    title('lenaG');
    subplot(y,x,8);
    imshow(lenaB);
    title('lenaB');
    
    subplot(y,x,9);
    imhist(lenaR);
    title('lenaR hist');
    subplot(y,x,10:11);
    imhist(lenaG);
    title('lenaG hist');
    subplot(y,x,12);
    imhist(lenaB);
    title('lenaB hist');

    %% 5. Wyr?wnanie w rgb
    Re = histeq(lenaR, 256);
    Ge = histeq(lenaG, 256);
    Be = histeq(lenaB, 256);

    %% 6. Z?o?enie w nowy obrazek
    lenaEQ = lena;
    lenaEQ(:,:,1) = Re;
    lenaEQ(:,:,2) = Ge;
    lenaEQ(:,:,3) = Be;
    subplot(y,x,3:4);
    imshow(lenaEQ);
    title('wyr?wnana lena');

end