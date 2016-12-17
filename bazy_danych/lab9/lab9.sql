-- 9.1 Przygotuj skrypt implementujący bazę danych kwiaciarnia zgodnie z przedstawionym poniżej projektem i opisem.
-- w pliku kwiaciarnia.sql

-- 9.2.1 Wykonaj skrypt tworzący relacje w bazie danych kwiaciarnia.
-- w pliku kwiaciarnia.sql

-- 9.2.2 Przygotuj odpowiednio dane z pliku kwiaciarnia2dane-tekst.txt i zaimportuj je do bazy danych.
-- w pliku kwiaciarnia-dane.sql

-- 9.2.3 Sprawdź (np. wykonując zapytania), czy wszystkie dane zostały zaimportowane do bazy danych.
\d historia
select * from historia
-- itd

-- 9.2.4 Jak sprawdzić wartość klucza głównego dla ostatnio dodanego rekodu do tabeli odbiorcy w ramach tej samej sesji?
select last_value from odbiorcy_idodbiorcy_seq;

-- 9.2.5 Zweryfikuj działanie sekwencji. Otwórz dwie sesje z baza danych (dwa emulatoy terminala) A i B. Wykonaj odpowiednio co następuje.
-- Term 1
insert into odbiorcy (nazwa, miasto, kod, adres) values ('Edmund Pasza', 'Krakow', '32-223', 'ul. Taka');
-- Term 2
insert into odbiorcy (nazwa, miasto, kod, adres) values ('Ela Budrys', 'Zielonki', '21-323', 'ul. Smaka');
-- Term 1
insert into zamowienia values (999999999, 'msowins', currval('odbiorcy_idodbiorcy_seq'), 'buk1', '2007-04-28', null, null, null);
-- Term 2
insert into zamowienia values (999999998, 'msowins', currval('odbiorcy_idodbiorcy_seq'), 'buk2', '2007-04-29', null, null, null);
--     999999999 | msowins   |         28 | buk1         | 2007-04-28 |        |           |
--     999999998 | msowins   |         29 | buk2         | 2007-04-29 |        |           |

--         28 | Edmund Pasza       | KKrakow     | 32-223 | ul. Taka
--         29 | Ela Budrys         | Zielonki    | 21-323 | ul. Smaka
-- są poprawne.

-- 9.3 Przygotuj skrypt implementujący bazę danych firma zgodnie z przedstawionym poniżej opisem.
-- w pliku firma.sql

-- 9.4 Narysuj schemat bazy danych firma (patrz schematy baz danych na slajdach do wykładu).
-- w pliku firma.dia oraz firma.png

-- 9.5.1 Wykonaj skrypt tworzący relacje w bazie danych firma.
-- w pliku firma.sql

-- 9.5.2 ★ Przygotuj skrypt z instrukcjami insert into, wstawiający do bazy firma poniższe krotki:
-- w pliku firma.sql

-- 9.6.1 Wyświetla nazwisko, wiek oraz roczne pobory pracownika posortowane wg poborów oraz nazwiska (pole pobory w tabeli pracownicy określa pobory miesięczne).
select nazwisko, date_part('year', age(now(), dataurodzenia)) as "wiek", pobory from pracownicy order by pobory, nazwisko;
-- 9.6.2 Wyświetla nazwisko, imię, datę urodzenia, stanowisko, dział i pobory pracownika, który pracuje na stanowisku robotnik lub analityk i zarabia więcej niż 2000 miesięcznie.
select * from pracownicy where stanowisko in ('robotnik', 'analityk') and pobory > 2000;
-- 9.6.3 Wyświetla nazwiska i imiona pracowników, którzy zarabiają więcej niż zarabia Adam Kowalik.
select imie, nazwisko from pracownicy where pobory > (select pobory from pracownicy where imie = 'Adam' and nazwisko = 'Kowalik');
-- 9.6.4 Podnosi zarobki o 10% na stanowisku robotnik.
update pracownicy set pobory = 1.1 * pobory where stanowisko = 'robotnik';
-- 9.6.5 Oblicza średnie zarobki oraz ilość pracowników na poszczególnych stanowiskach z wyłączeniem stanowisk kierownik.
select stanowisko, count(*), avg(pobory)::numeric(10,2) from pracownicy where stanowisko not in ('kierownik') group by stanowisko;

