4.1.1 select k.nazwa from klienci k;
4.1.2 SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z;
4.1.3 SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z WHERE z.idklienta = k.idklienta;
4.1.4 SELECT k.nazwa, z.idzamowienia FROM klienci k NATURAL JOIN zamowienia z;
4.1.5 SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z ON z.idklienta=k.idklienta;
4.1.6 SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z USING (idklienta);
4.1.7 W którym zapytaniu występuje iloczyn kartezjański?
    Iloczyn kartezjański występuje w 4.1.2 oraz 4.1.3
4.1.8 Które zapytanie dostarcza bezwartościowych danych?
    4.1.2 dostarcza bezsensownych danych, bo jest to połączenie każdy z każdym, lol

4.2.1 zostały złożone przez klienta, który ma na imię Antoni,
    select idzamowienia, datarealizacji from zamowienia natural join klienci where nazwa like '%Antoni%';
4.2.2 zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
    select idzamowienia, datarealizacji, ulica from zamowienia natural join klienci where ulica like '%/%';
4.2.3 ★ zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.
    select idzamowienia, datarealizacji from zamowienia natural join klienci where miejscowosc = 'Kraków' and date_part('month', datarealizacji) = 11 and date_part('year', datarealizacji) = 2013;

4.3.1 złożyli zamówienia z datą realizacji nie starszą niż sprzed pięciu lat
    select nazwa, ulica, miejscowosc, datarealizacji from klienci natural join zamowienia where datarealizacji >= now() - interval '5 years';
4.3.2 zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,
    select k.nazwa, k.ulica, k.miejscowosc from klienci k natural join zamowienia z natural join artykuly a join pudelka p on a.idpudelka = p.idpudelka where p.nazwa in ('Kremowa fantazja', 'Kolekcja jesienna');
4.3.3 złożyli przynajmniej jedno zamówienie,
    select nazwa, ulica, miejscowosc from klienci right join zamowienia using(idklienta);
4.3.4 nie złożyli żadnych zamówień,
    select nazwa, ulica, miejscowosc from klienci except select distinct nazwa, ulica, miejscowosc from klienci natural join zamowienia;
