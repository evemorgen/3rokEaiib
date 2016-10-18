function zloz(celki, lista_obrazow)
    numery_obrazkow = lista_obrazow;
    [Y,X] = size(celki{1});
    wynikowy_obraz = uint8(zeros(Y,X));
    for obr = numery_obrazkow
        do_dodania = uint8((2^obr)*celki{obr});
        wynikowy_obraz = imadd(wynikowy_obraz, do_dodania);
    end
    imshow(wynikowy_obraz);
    title(int2str(numery_obrazkow));
end