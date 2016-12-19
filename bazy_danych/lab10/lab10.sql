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


-- 10.2.2 zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),

-- 10.2.3 ★ zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.

-- 10.3 Napisz zapytanie wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość), używając odpowiedniego operatora in/not in/exists/any/all, którzy:


-- 10.3.1 złożyli zamówienia z datą realizacji 12.11.2013,

-- 10.3.2 złożyli zamówienia z datą realizacji w listopadzie 2013,

-- 10.3.3 zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,

-- 10.3.4 zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia,

-- 10.3.5 zamówili pudełka, które zawierają czekoladki z migdałami,

-- 10.3.6 złożyli przynajmniej jedno zamówienie,

-- 10.3.7 nie złożyli żadnych zamówień.

-- 10.4. Napisz zapytanie wyświetlające informacje na temat pudełek z czekoladkami (nazwa, opis, cena), używając odpowiedniego operatora, np. in/not in/exists/any/all, które:

-- 10.4.1 ★ zawierają czekoladki o wartości klucza głównego D09

-- 10.4.2 ★ zawierają czekoladki Gorzka truskawkowa,

-- 10.4.3 ★ zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S,

-- 10.4.4 ★ zawierają przynajmniej 4 sztuki czekoladek jednego gatunku (o takim samym kluczu głównym),

-- 10.4.5 ★ zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa,

-- 10.4.6 ★ zawierają czekoladki z nadzieniem truskawkowym,

-- 10.4.7 nie zawierają czekoladek w gorzkiej czekoladzie,

-- 10.4.8 nie zawierają czekoladek z orzechami,

-- 10.4.9 zawierają przynajmniej jedną czekoladkę bez nadzienia.


-- 10.5 Napisz poniższe zapytania w języku SQL (używając odpowiedniego operatora, np. in/not in/exists/any/all):

-- 10.5.1 Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt jest większy od czekoladki o wartości klucza głównego równej D08.

-- 10.5.2 ★ Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiała Gorka Alicja.

-- 10.5.3 ★ Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiali klienci z Katowic.


-- 10.6 Wyświetl nazwę pudełka oraz ilość czekoladek, dla:

-- 10.6.1 pudełka o największej liczbie czekoladek (bez użycia klauzuli limit),

-- 10.6.2 ★ pudełka o najmniejszej liczbie czekoladek (bez użycia klauzuli limit),

-- 10.6.3 ★ pudełka, w którym liczba czekoladek jest powyżej średniej.

-- 10.6.4 ★ pudełka o największej lub najmniejszej liczbie czekoladek.


-- 10.7 Napisz zapytanie wyświetlające: liczbę porządkową i identyfikator pudełka czekoladek (idpudelka). Identyfikatory pudełek mają być posortowane alfabetycznie, rosnąco. Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.

-- Użyj podzapytania w klauzuli select:
-- select kolumna1, kolumna2, (select ...) from ...


