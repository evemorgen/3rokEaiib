--2.1.1 wyświetla listę klientów (nazwa, telefon, ulica) posortowaną według nazw klientów,
select k.nazwa, k.telefon, a.ulica from klienci k natural join adresy a order by k.nazwa;

--2.1.2 wyświetla listę klientów posortowaną malejąco według nazw ulic, a w ramach tej samej ulicy rosnąco według nazw klientów,
select k.nazwa, k.telefon, a.ulica, a.numer_domu from klienci k natural join adresy a order by k.nazwa DESC, a.ulica ASC;

--2.1.3 wyświetla listę klientów z ulicy Kruczej lub z Akacjowej posortowaną malejąco według nazw ulicy, a w ramach tej samej ulicy rosnąco według nazw klientów (zapytanie utwórz na dwa sposoby stosując w kryteriach or lub in).
select k.nazwa, k.telefon, a.ulica, a.numer_domu from klienci k natural join adresy a where a.ulica in ('Krucza', 'Akacjowa') order by k.nazwa DESC, a.ulica ASC;
select k.nazwa, k.telefon, a.ulica, a.numer_domu from klienci k natural join adresy a where a.ulica = 'Krucza' or a.ulica = 'Akacjowa' order by k.nazwa DESC, a.ulica ASC;

--2.2.1 wyświetla nazwę i masę składników, których masa jest większa niż 20 g,
select nazwa, masa from skladniki where masa > 20;

--2.2.2 wyświetla nazwę, masę i koszt produkcji składników, których masa jest większa niż 20 g i koszt produkcji jest większy niż 5zł,
select nazwa, masa, koszt from skladniki where masa > 20 and koszt > 5.0;

--2.2.3 j.w. ale koszt groszach
select nazwa, masa, (koszt * 100) as "cena w groszach" from skladniki;

--2.4.1 masa mieści się w przedziale od 15 do 24 g,
select id_skladnika, nazwa, masa, koszt from skladniki where masa between 10 and 25;

--2.4.2 koszt produkcji mieści się w przedziale od 25 do 35 gr,
select id_skladnika, nazwa, masa, koszt from skladniki where koszt > 0.25 and koszt < 0.35;

--2.5.5 znany jest profil wegetariańskości danego składnika
select s.id_skladnika, s.nazwa, s.koszt, s.masa, t.nazwa, t.wegetarianski from skladniki s join typ_skladnika t using(id_typ) where t.wegetarianski is not null;

--3.1.2 między 1 i 6 grudnia lub między 15 i 20 grudnia 2016




