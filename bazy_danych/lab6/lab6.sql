--6.1.1 Napisz i wykonaj zapytanie (użyj INSERT), które dodaje do tabeli czekoladki następujące informacje:
--idczekoladki: W98,
--nazwa: Biały kieł,
--czekolada: biała,
--orzechy: laskowe,
--nadzienie: marcepan,
--opis: Rozpływające się w rękach i kieszeniach,
--koszt: 45 gr,
--masa: 20 g.

insert into czekoladki values ('W98', 'Biały kieł', 'biała', 'laskowe', 'marcepan', 'Rozpływające się w rękach i kieszeniach', 0.45, 20);

--6.1.2 Napisz i wykonaj trzy zapytania (użyj INSERT), które dodadzą do tabeli klienci następujące dane osobowe:idklienta: 90,
--nazwa: Matusiak Edward,
--ulica: Kropiwnickiego 6/3,
--miejscowosc: Leningrad,
--kod: 31-471,
--telefon: 031 423 45 38,

--idklienta: 91,
--nazwa: Matusiak Alina,
--ulica: Kropiwnickiego 6/3,
--miejscowosc: Leningrad,
--kod: 31-471,
--telefon: 031 423 45 38,
--
--idklienta: 92,
--nazwa: Kimono Franek,
--ulica: Karateków 8,
--miejscowosc: Mistrz,
--kod: 30-029,
--telefon: 501 498 324.

insert into klienci values (90, 'Matusiak Edward', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 423 45 38'), (91, 'Matusiak Alina', 'Kropiwnickiego 6/3', 'Leninigrad', '31-471', '031 423 45 38'), (92, 'Kimono Franek', 'Karateków 9', 'Mistrz', '30-029', '501 498 324');

--6.1.3 Dodaj do tabeli klienci dane Izy Matusiak (idklienta 93). Pozostałe dane osobowe Izy Matusiak muszą być takie same jak dla Pana Edwarda Matusiaka. Użyj podzapytań.
insert into klienci values (93, 'Iza Matusiak', (select ulica from klienci where nazwa = 'Matusiak Edward'), (select miejscowosc from klienci where nazwa = 'Matusiak Edward'), (select kod from klienci where nazwa = 'Matusiak Edward'), (select telefon from klienci where nazwa = 'Matusiak Edward'));

--6.1.4 Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj. czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.
select * from klienci where idklienta in (90, 91, 92, 93);


--6.2.1 Napisz i wykonaj zapytanie, które doda do tabeli czekoladki następujące pozycje, wykorzystaj wartości NULL w poleceniu INSERT:

--IDCzekoladki: X91,
--Nazwa: Nieznana Nieznajoma,
--Opis: Niewidzialna czekoladka wspomagajaca odchudzanie.,
--Koszt: 26 gr,
--Masa: 0g,
--
--IDCzekoladki: M98,
--Nazwa: Mleczny Raj,
--Czekolada: Mleczna,
--Opis: Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,
--Koszt: 26 gr,
--Masa: 36 g,

insert into czekoladki values ('X91', 'Nieznana Nieznajoma', null, null, null, 'Niewidzialna czekoladka wspomagajaca odchudzanie', 0.26, 36);

insert into czekoladki values ('M98', 'Mleczny Raj', 'mleczna', null, null, 'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.', 0.26, 36);

--6.2.2 Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj. czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.
select * from czekoladki where idczekoladki in ('X91', 'M98');


--6.3.1. Napisz zapytanie, które usunie informacje dodane w Zadaniu 6.2, użyj DELETE.
delete from czekoladki where idczekoladki in ('X91', 'M98');

--6.3.2 Sprawdź, czy odpowiednie rekordy zostały usunięte.
select * from czekoladki where idczekoladki in ('X91', 'M98');

--6.3.3 Napisz i wykonaj zapytanie, które doda do tabeli czekoladki następujące pozycje, wykorzystaj nazwy kolumn w poleceniu INSERT:
--IDCzekoladki: X91,
--Nazwa: Nieznana Nieznajoma,
--Opis: Niewidzialna czekoladka wspomagajaca odchudzanie.,
--Koszt: 26 gr,
--Masa: 0g,
--
--IDCzekoladki: M98,
--Nazwa: Mleczny Raj,
--Czekolada: Mleczna,
--Opis: Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,
--Koszt: 26 gr,
--Masa: 36g,

insert into czekoladki (idczekoladki, nazwa, opis, koszt, masa) values ('X91', 'Nieznana nieznajoma', 'Niewidzialna czekoladka wspomagajaca odchudzanie.', 0.26, 0);

insert into czekoladki (idczekoladki, nazwa, czekolada, opis, koszt, masa) values ('M98', 'Mleczny Raj', 'Mleczna', 'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.', 0.26, 36);

--6.3.4 Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj. czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.
select * from czekoladki where idczekoladki in ('X91', 'M98');


--6.4.1 Zmiana nazwiska Izy Matusiak na Nowak.
update klienci SET nazwa = 'Iza Nowak' where nazwa = 'Iza Matusiak';
select * from klienci where nazwa = 'Iza Nowak';

--6.4.2 Obniżenie kosztu czekoladek o identyfikatorach (idczekoladki): W98, M98 i X91, o 10%.
update czekoladki set koszt = koszt * 0.9 where idczekoladki in ('W98', 'M98', 'X91');
select * from czekoladki where idczekoladki in ('W98', 'M98', 'X91');

--6.4.3 Ustalenie kosztu czekoladek o nazwie Nieznana Nieznajoma na taką samą jak cena czekoladki o identyfikatorze W98.
update czekoladki set koszt = (select koszt from czekoladki where idczekoladki = 'W98') where nazwa = 'Nieznana nieznajoma';
select * from czekoladki where nazwa = 'Nieznana nieznajoma';

--6.4.4 ★ Zmiana nazwy z Leningrad na Piotrograd w tabeli klienci.
update klienci set miejscowosc = 'Piotrkograd' where miejscowosc = 'Leningrad';
select * from klienci where miejscowosc = 'Piotrkograd';
select * from klienci where miejscowosc = 'Leningrad';

--6.4.5 ★ Podniesienie kosztu czekoladek, których dwa ostatnie znaki identyfikatora (idczekoladki) są większe od 90, o 15 groszy.
update czekoladki SET koszt = koszt + 15 where substring(idczekoladki from 2 for 2)::integer > 90;


--6.5.1 del info about klientach o nazwisku Matusiak,
delete from klienci where nazwa like '%Matusiak%';
select * from klienci where nazwa like '%Matusiak%';

--6.5.2 ★ klientach o identyfikatorze większym niż 91,
delete from klienci where idklienta > 91;

--6.5.3 ★ czekoladkach, których koszt jest większy lub równy 0.45 lub masa jest większa lub równa 36, lub masa jest równa 0.
delete from czekoladki where koszt >= 0.45 or masa >= 36 or masa = 0;


--6.6.1 Napisz skrypt zawierający instrukcje INSERT wstawiające do bazy danych Cukiernia dwa nowe rekordy do tabeli Pudelka oraz odpowiednie rekordy związane z tymi pudełkami do tabeli Zawartosc. Każde z nowych pudełek ma zawierać łącznie co najmniej 10 czekoladek, w co najmniej 4 różnych smakach.
insert into pudelka values ('dupa', 'Super pudełko', 'To jest super pudełko', 99.00, 0);
insert into zawartosc values ('dupa', 'b06', 2);
insert into zawartosc values ('dupa', 'd11', 2);
insert into zawartosc values ('dupa', 'f01', 4);
insert into zawartosc values ('dupa', 'm01', 4);

insert into pudelka values ('pupa', 'Super pudełko2', 'To jest super pudełko2', 77.00, 1);
insert into zawartosc values ('pupa', 'd09', 1);
insert into zawartosc values ('pupa', 'd08', 3);
insert into zawartosc values ('pupa', 'd07', 3);
insert into zawartosc values ('pupa', 'd06', 3);
psql -a -f skrypt1.sql


--6.8.1 Napisz instrukcję UDPATE, która dla pudełek dodanych w poprzednich dwóch zadaniach, zwiększa o 1 liczbę czekoladek każdego smaku, które w nich występują.
update zawartosc set sztuk = sztuk + 1 where idpudelka in ('dupa', 'pupa');

--6.8.2 Napisz skrypt zawierający instrukcje UPDATE, które modyfikują tabelę czekoladki zastępując w kolumnach: czekolada, orzechy i nadzienie wartości Null wartością “brak”.
update czekoladki set czekolada = 'brak' where czekolada is null;
update czekoladki set orzechy = 'brak' where orzechy is null;
update czekoladki set nadzienie = 'brak' where nadzienie is null;
psql -a -f skrypt2.sql

--6.8.3 ★ Napisz skrypt zawierający instrukcje UPDATE, które anulują zmiany wprowadzone w poprzednim punkcie.
update czekoladki set czekolada = null where czekolada = 'brak';
update czekoladki set orzechy = null where orzechy = 'brak';
update czekoladki set nadzienie = null where nadzienie = 'brak';
psql -a -f skrypt3.sql
