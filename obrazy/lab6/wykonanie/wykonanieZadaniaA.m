obrazek = 'coins.png'
%obrazek = 'rice.png'
%obrazek = 'tekst.bmp'
%obrazek = 'obiekty.bmp'
%obrazek = 'katalog.bmp'

zadaniaA(obrazek, 80); %spoko
graythresh(imread(obrazek)) % 0.4941
zadaniaA(obrazek, 122)
zadaniaA(obrazek, clusterKittler(imread(obrazek))) % 95
zadaniaA(obrazek, entropyYen(imread(obrazek))) % 77
zadaniaA('figura.png', 80); %spoko
zadaniaA('figura2.png', 120); %spoko
zadaniaA('figura3.png', 75); %ciężko
zadaniaA('figura4.png', 45); % mocno ciężko

