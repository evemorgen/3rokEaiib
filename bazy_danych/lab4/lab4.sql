--4.1.1
select k.nazwa from klienci k;

--4.1.2
SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z;

--4.1.3
SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z WHERE z.idklienta = k.idklienta;

--4.1.4
SELECT k.nazwa, z.idzamowienia FROM klienci k NATURAL JOIN zamowienia z;

--4.1.5
SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z ON z.idklienta=k.idklienta;

--4.1.6
SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z USING (idklienta);

--4.1.7 W którym zapytaniu występuje iloczyn kartezjański?
--    Iloczyn kartezjański występuje w 4.1.2 oraz 4.1.3

--4.1.8 Które zapytanie dostarcza bezwartościowych danych?
--    4.1.2 dostarcza bezsensownych danych, bo jest to połączenie każdy z każdym, lol


--4.2.1 zostały złożone przez klienta, który ma na imię Antoni,
select idzamowienia, datarealizacji from zamowienia natural join klienci where nazwa like '%Antoni%';

--4.2.2 zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
select idzamowienia, datarealizacji, ulica from zamowienia natural join klienci where ulica like '%/%';

--4.2.3 ★ zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.
select idzamowienia, datarealizacji from zamowienia natural join klienci where miejscowosc = 'Kraków' and date_part('month', datarealizacji) = 11 and date_part('year', datarealizacji) = 2013;


--4.3.1 złożyli zamówienia z datą realizacji nie starszą niż sprzed pięciu lat
select nazwa, ulica, miejscowosc, datarealizacji from klienci natural join zamowienia where datarealizacji >= now() - interval '5 years';

--4.3.2 zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,
select distinct k.nazwa, k.ulica, k.miejscowosc, p.nazwa from klienci k natural join zamowienia z natural join artykuly a join pudelka p on a.idpudelka = p.idpudelka where p.nazwa in ('Kremowa fantazja', 'Kolekcja jesienna');

--4.3.3 złożyli przynajmniej jedno zamówienie,
select distinct nazwa, ulica, miejscowosc from klienci right join zamowienia using(idklienta);

--4.3.4 nie złożyli żadnych zamówień,
select nazwa, ulica, miejscowosc from klienci except select distinct nazwa, ulica, miejscowosc from klienci natural join zamowienia;

--4.3.5 ★ złożyli zamówienia z datą realizacji w listopadzie 2013,
select nazwa, ulica, miejscowosc, datarealizacji from klienci natural join zamowienia where date_part('month',datarealizacji) = 11 and date_part('year', datarealizacji) = 2013;

--4.3.6 ★ zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia
select z.idzamowienia, k.nazwa, k.ulica, k.miejscowosc, p.nazwa, a.sztuk from klienci k natural join zamowienia z natural join artykuly a join pudelka p on p.idpudelka = a.idpudelka where a.sztuk >= 2 and p.nazwa in ('Kremowa fantazja', 'Kolekcja jesienna');

--4.3.7 ★ zamówili pudełka, które zawierają czekoladki z migdałami.
select distinct  k.nazwa, k.ulica, k.miejscowosc, c.orzechy from klienci k natural join zamowienia z natural join artykuly a join zawartosc x on x.idpudelka = a.idpudelka join czekoladki c on c.idczekoladki = x.idczekoladki where c.orzechy = 'migdały';


--4.4.1 wszystkich pudełek,
select p.nazwa as "nazwa pudełka", p.opis as "opis pudełka", c.nazwa as "nazwa czekoladki", c.opis as "opis czekoladki" from pudelka p natural join zawartosc z join czekoladki c on z.idczekoladki = c.idczekoladki;

--4.4.2 pudełka o wartości klucza głównego heav,
select p.idpudelka, p.nazwa as "nazwa pudełka", p.opis as "opis pudełka", c.nazwa as "nazwa czekoladki", c.opis as "opis czekoladki" from pudelka p natural join zawartosc z join czekoladki c on z.idczekoladki = c.idczekoladki where p.idpudelka = 'heav';

--4.4.3 ★ pudełek, których nazwa zawiera słowo Kolekcja.
select p.nazwa as "nazwa pudełka", p.opis as "opis pudełka", c.nazwa as "nazwa czekoladki", c.opis as "opis czekoladki" from pudelka p natural join zawartosc z join czekoladki c on z.idczekoladki = c.idczekoladki where p.nazwa similar to '%Kolekcja%';


--4.5.1 zawierają czekoladki o wartości klucza głównego d09
select c.idczekoladki, p.nazwa, p.opis, p.cena from pudelka p natural join zawartosc z join czekoladki c on z.idczekoladki = c.idczekoladki where c.idczekoladki = 'd09';

--4.5.2 zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S,
select count(c.nazwa) as "Liczba czekoladek", p.nazwa as "nazwa pudełka", p.opis, p.cena from pudelka p natural join zawartosc z join czekoladki c on z.idczekoladki = c.idczekoladki where c.nazwa similar to 'S%' group by p.nazwa, p.opis, p.cena;

--4.5.3 zawierają przynajmniej 4 sztuki czekoladek jednego gatunku (o takim samym kluczu głównym),
select distinct p.nazwa, p.opis, p.cena from pudelka p natural join zawartosc z where z.sztuk >= 4;

--4.5.4 zawierają czekoladki z nadzieniem truskawkowym,
select distinct p.nazwa, p.opis, p.cena, c.nadzienie from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) where c.nadzienie = 'truskawki';

--4.5.5 nie zawierają czekoladek w gorzkiej czekoladzie,
select p.nazwa, p.opis, p.cena from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) except select p.nazwa, p.opis, p.cena from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) where c.czekolada = 'gorzka';

--4.5.6 ★ zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa,
select p.nazwa, p.opis, p.cena, z.sztuk from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) where c.nazwa = 'Gorzka truskawkowa' and z.sztuk >= 3;

--4.5.7 ★ nie zawierają czekoladek z orzechami,
select p.nazwa, p.opis, p.cena, c.orzechy from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) except select p.nazwa, p.opis, p.cena, c.orzechy from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) where c.orzechy is not null;

--4.5.8 ★ zawierają czekoladki Gorzka truskawkowa,
select distinct p.nazwa, p.opis, p.cena, c.nazwa from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) where c.nazwa = 'Gorzka truskawkowa';

--4.5.9 ★ zawierają przynajmniej jedną czekoladkę bez nadzienia.
select distinct p.nazwa, p.opis, p.cena from pudelka p natural join zawartosc z join czekoladki c using(idczekoladki) where c.nadzienie is null;


--4.6.1 Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt jest większy od czekoladki o wartości klucza głównego równej d08.
select idczekoladki, nazwa, koszt, (select koszt from czekoladki where idczekoladki = 'd08') as "koszt d08" from czekoladki where koszt > (select koszt from czekoladki where idczekoladki = 'd08');

--4.6.2 Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiała Górka Alicja.
select distinct k.nazwa from klienci k natural join zamowienia z natural join artykuly a where idpudelka in (select distinct idpudelka from zamowienia z natural join klienci k natural join artykuly a where k.nazwa = 'Górka Alicja');

--4.6.3 ★ Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiali klienci z Katowic.
select distinct k.nazwa, k.ulica from klienci k natural join zamowienia z natural join artykuly a where a.idpudelka in (select distinct a.idpudelka from artykuly a natural join zamowienia z natural join klienci k where k.miejscowosc = 'Katowice');
