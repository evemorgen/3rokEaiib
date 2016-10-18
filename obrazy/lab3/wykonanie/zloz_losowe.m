function zloz_losowe(celki)
    ile_obrazkow = randi(8);
    numery_obrazkow = randperm(8, ile_obrazkow);
    zloz(celki, numery_obrazkow);
end