-- 10.1 Przeanalizuj poniższe zapytania i zinterpretuj ich znaczenie. Zwróć uwagę na operatory w klauzuli where:

-- SELECT DISTINCT nazwa
-- FROM pudelka NATURAL JOIN zawartosc
-- WHERE idczekoladki
--   IN (SELECT idczekoladki FROM czekoladki ORDER BY koszt LIMIT 3);

nazwy pudełek w ktorych występuje jedna z trzech najdroższych czekoladek

-- SELECT nazwa
-- FROM czekoladki
-- WHERE koszt = (SELECT MAX(koszt) FROM czekoladki);

nazwa czekoladki ktora kosztuje najwiecej

-- SELECT p.nazwa, idpudelka
-- FROM (SELECT idczekoladki FROM czekoladki ORDER BY koszt LIMIT 3)
--   AS ulubioneczekoladki
-- NATURAL JOIN zawartosc
-- NATURAL JOIN pudelka p;

nazwa czekoladki oraz id pudelka w ktorych wystepuja najdrozsze czekoladki

-- SELECT nazwa, koszt, (SELECT MAX(koszt) FROM czekoladki) AS MAX FROM czekoladki;

nazwa, koszt czekoladek oraz koszt najdrozszej czekoladki


-- 10.2 Napisz zapytanie wyświetlające informacje na temat zamówień (dataRealizacji, idzamowienia) używając odpowiedniego operatora in/not in/exists/any/all, które:

-- 10.2.1 zostały złożone przez klienta, który ma na imię Antoni,
select datarealizacji, idzamowienia from zamowienia where idklienta in (select idklienta from klienci where nazwa like '%Antoni%');
select datarealizacji, idzamowienia from zamowienia where idklienta = any (select idklienta from klienci where nazwa like '%Antoni%');

-- 10.2.2 zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
select datarealizacji, idzamowienia from zamowienia where idklienta in (select idklienta from klienci where ulica ~ '\d{1,2}\/\d{1,2}');
select datarealizacji, idzamowienia from zamowienia where idklienta = any (select idklienta from klienci where ulica ~ '\d{1,2}\/\d{1,2}');

-- 10.2.3 ★ zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.
select datarealizacji, idzamowienia from zamowienia where idklienta in (select idklienta from klienci where miejscowosc = 'Kraków') and datarealizacji::text ~ '2013-11-\d\d';


-- 10.3 Napisz zapytanie wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość), używając odpowiedniego operatora in/not in/exists/any/all, którzy:

-- 10.3.1 złożyli zamówienia z datą realizacji 12.11.2013,
select nazwa, ulica, miejscowosc from klienci where idklienta in (select idklienta from zamowienia where datarealizacji = '2013-11-12');

-- 10.3.2 złożyli zamówienia z datą realizacji w listopadzie 2013,
select nazwa, ulica, miejscowosc from klienci where idklienta in (select idklienta from zamowienia where datarealizacji::text ~ '2013-11-\d{1,2}');

-- 10.3.3 zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,
select nazwa, ulica, miejscowosc from klienci where idklienta in (select distinct idklienta from zamowienia where idzamowienia in (select distinct idzamowienia from artykuly where idpudelka in (select idpudelka from pudelka where nazwa in ('Kremowa fantazja', 'Kolekcja jesienna'))));

-- 10.3.4 zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia,
select nazwa, ulica, miejscowosc from klienci where idklienta in (select distinct idklienta from zamowienia where idzamowienia in (select distinct idzamowienia from artykuly where idpudelka in (select idpudelka from pudelka where nazwa in ('Kremowa fantazja', 'Kolekcja jesienna'))) and idzamowienia in (select idzamowienia from artykuly where sztuk >= 2));

-- 10.3.5 zamówili pudełka, które zawierają czekoladki z migdałami,
select nazwa, ulica, miejscowosc from klienci where idklienta in (select distinct idklienta from zamowienia where idzamowienia in (select distinct idzamowienia from artykuly where idpudelka in (select distinct idpudelka from zawartosc where idczekoladki in (select idczekoladki from czekoladki where orzechy = 'migdały'))));

-- 10.3.6 złożyli przynajmniej jedno zamówienie,
select nazwa, ulica, miejscowosc from klienci where idklienta in (select distinct idklienta from zamowienia);

-- 10.3.7 nie złożyli żadnych zamówień.
select nazwa, ulica, miejscowosc from klienci where idklienta not in (select distinct idklienta from zamowienia);


-- 10.4. Napisz zapytanie wyświetlające informacje na temat pudełek z czekoladkami (nazwa, opis, cena), używając odpowiedniego operatora, np. in/not in/exists/any/all, które:

-- 10.4.1 ★ zawierają czekoladki o wartości klucza głównego d09
select nazwa, opis, cena from pudelka where idpudelka in (select idpudelka from zawartosc where idczekoladki = 'd09');

-- 10.4.2 ★ zawierają czekoladki Gorzka truskawkowa,
select nazwa, opis, cena from pudelka where idpudelka in (select idpudelka from zawartosc where idczekoladki in (select idczekoladki from czekoladki where nazwa = 'Gorzka truskawkowa'));

-- 10.4.3 ★ zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S,
select nazwa, opis, cena from pudelka where idpudelka in (select distinct idpudelka from zawartosc where idczekoladki in (select idczekoladki from czekoladki where nazwa ~ 'S.*'));

-- 10.4.4 ★ zawierają przynajmniej 4 sztuki czekoladek jednego gatunku (o takim samym kluczu głównym),
select nazwa, opis, cena from pudelka where idpudelka in (select distinct idpudelka from zawartosc where sztuk >= 4);

-- 10.4.5 ★ zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa,
select nazwa, opis, cena from pudelka where idpudelka in (select distinct idpudelka from zawartosc where idczekoladki in (select idczekoladki from czekoladki where nazwa = 'Gorzka truskawkowa') and sztuk >= 3);

-- 10.4.6 ★ zawierają czekoladki z nadzieniem truskawkowym,
select nazwa, opis, cena from pudelka where idpudelka in (select distinct idpudelka from zawartosc where idczekoladki in (select idczekoladki from czekoladki where nadzienie = 'truskawki'));

-- 10.4.7 nie zawierają czekoladek w gorzkiej czekoladzie,
elect nazwa, opis, cena from pudelka where idpudelka in (select distinct idpudelka from zawartosc where idczekoladki not in (select idczekoladki from czekoladki where czekolada = 'gorzka'));

-- 10.4.8 nie zawierają czekoladek z orzechami,
select nazwa, opis, cena from pudelka where idpudelka in (select distinct idpudelka from zawartosc where idczekoladki not in (select idczekoladki from czekoladki where orzechy is null));

-- 10.4.9 zawierają przynajmniej jedną czekoladkę bez nadzienia.
select nazwa, opis, cena from pudelka where idpudelka in (select distinct idpudelka from zawartosc where idczekoladki in (select idczekoladki from czekoladki where nadzienie is null));


-- 10.5 Napisz poniższe zapytania w języku SQL (używając odpowiedniego operatora, np. in/not in/exists/any/all):

-- 10.5.1 Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt jest większy od czekoladki o wartości klucza głównego równej D08.
select idczekoladki, nazwa from czekoladki where koszt > (select koszt from czekoladki where idczekoladki = 'd08');

-- 10.5.2 ★ Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiała Gorka Alicja.
select nazwa from klienci where idklienta in (select distinct idklienta from zamowienia where idzamowienia in (select distinct idzamowienia from artykuly where idpudelka in (select idpudelka from artykuly where idzamowienia in (select idzamowienia from zamowienia where idklienta = (select idklienta from klienci where nazwa = 'Górka Alicja')))));

-- 10.5.3 ★ Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiali klienci z Katowic.
select nazwa, ulica, miejscowosc, kod from klienci where idklienta in (select distinct idklienta from zamowienia where idzamowienia in (select distinct idzamowienia from artykuly where idpudelka in (select distinct idpudelka from artykuly where idzamowienia in (select idzamowienia from zamowienia where idklienta in (select idklienta from klienci where miejscowosc = 'Katowice')))));


-- 10.6 Wyświetl nazwę pudełka oraz ilość czekoladek, dla:

-- 10.6.1 pudełka o największej liczbie czekoladek (bez użycia klauzuli limit),
select * from pudelka where idpudelka in (select idpudelka from zawartosc group by idpudelka having sum(sztuk) = (select max(suma) from (select  sum(sztuk) as suma from zawartosc group by idpudelka) as dupa));

-- 10.6.2 ★ pudełka o najmniejszej liczbie czekoladek (bez użycia klauzuli limit),
select * from pudelka where idpudelka in (select idpudelka from zawartosc group by idpudelka having sum(sztuk) = (select min(suma) from (select  sum(sztuk) as suma from zawartosc group by idpudelka) as dupa));

-- 10.6.3 ★ pudełka, w którym liczba czekoladek jest powyżej średniej.
select nazwa from pudelka where idpudelka in (select idpudelka from zawartosc group by idpudelka having sum(sztuk) > (select avg(suma) from (select sum(sztuk) as suma from zawartosc group by idpudelka) as dupa) order by sum(sztuk) desc);
-- 10.6.4 ★ pudełka o największej lub najmniejszej liczbie czekoladek.
select * from pudelka where idpudelka in (select idpudelka from zawartosc group by idpudelka having sum(sztuk) in ((select min(suma) from (select sum(sztuk) as suma from zawartosc group by idpudelka) as dupa),(select max(suma) from (select sum(sztuk) as suma from zawartosc group by idpudelka) as dupa1)));

-- 10.7 Napisz zapytanie wyświetlające: liczbę porządkową i identyfikator pudełka czekoladek (idpudelka). Identyfikatory pudełek mają być posortowane alfabetycznie, rosnąco. Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.
create sequence if not EXISTS s1 start 1;
alter sequence s1 restart 1;
select nextval('s1'), id from (select idpudelka as id from pudelka order by idpudelka) as abba;

-- Użyj podzapytania w klauzuli select:
-- select kolumna1, kolumna2, (select ...) from ...
