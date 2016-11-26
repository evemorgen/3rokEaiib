--3.1.1 między 12 i 20 listopada 2013,
select idZamowienia, dataRealizacji from zamowienia where dataRealizacji between '2013-11-12' and '2013-11-20';

--3.1.2 między 1 i 6 grudnia lub między 15 i 20 grudnia 2013
select idZamowienia, dataRealizacji from zamowienia where dataRealizacji between '2013-12-01' and '2013-12-06' or dataRealizacji between '2013-12-15' and '2013-12-20';

--3.1.3 w listopadzie 2013 (w tym i kolejnych zapytaniach użyj funkcji datepart lub extract),
select idZamowienia, dataRealizacji from zamowienia where date_part('month', dataRealizacji) = 12;
select idZamowienia, dataRealizacji from zamowienia where extract(month from dataRealizacji) = 12;

--3.1.4 w listopadzie 2013 (w tym i kolejnych zapytaniach użyj funkcji datepart lub extract),
select idZamowienia, dataRealizacji from zamowienia where datepart('month' dataRealizacji) = 11 and date_part('year', dataRealizacji) = 2013;

--3.1.5 ★ w listopadzie lub grudniu 2013
select idZamowienia, dataRealizacji from zamowienia where date_part('month', dataRealizacji) in (11, 12) and date_part('year', dataRealizacji) = 2013;

--3.1.6 ★ 17, 18 lub 19 dnia miesiąca
select idZamowienia, dataRealizacji from zamowienia where date_part('day', dataRealizacji) in (17, 18, 19);

--3.1.7 ★ 46 lub 47 tygodniu roku.
select idZamowienia, dataRealizacji from zamowienia where date_part('week', dataRealizacji) in (46, 47);


--3.2.1 rozpoczyna się na literę 'S'
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'S%';

--3.2.2 rozpoczyna się na literę 'S' i kończy się na literę 'i'
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'S%i';

--3.2.3 rozpoczyna się na literę 'S' i zawiera słowo rozpoczynające się na literę 'm'
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'S% m%';

--3.2.4 rozpoczyna się na literę 'A', 'B' lub 'C'
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '(A|B|C)%';

--3.2.5 zawiera rdzeń 'orzech' (może on wystąpić na początku i wówczas będzie pisany z wielkiej litery)
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '(O|%o)rzech%';

--3.2.6 ★ rozpoczyna się na literę 'S' i zawiera w środku literę 'm'
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'S%m%';

--3.2.7 ★ zawiera słowo 'maliny' lub 'truskawki'
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '(%truskawki%|%maliny%)';

--3.2.8 ★ nie rozpoczyna się żadną z liter: 'D'-'K', 'S' i 'T'
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa not similar to '([D-K]%|S%|T%)' order by nazwa;

--3.2.9 ★ rozpoczyna się od 'Slod' ('Słod')
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'Słod%';

--3.2.10 ★ składa się dokładnie z jednego słowa
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where position(' ' in nazwa) = 0;


--3.3.1 wyświetla nazwy miast, z których pochodzą klienci cukierni i które składają się z więcej niż jednego słowa
select miejscowosc from klienci where miejscowosc like '% %';

--3.3.2 wyświetla nazwy klientów, którzy podali numer stacjonarny telefonu
select nazwa from klienci where telefon like '% % % %';

--3.3.3 ★ wyświetla nazwy klientów, którzy podali numer komórkowy telefonu
select nazwa from klienci where char_length(telefon) = 11;


--3.4.1 masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr
select idCzekoladki, nazwa, masa, koszt from czekoladki where masa between 15 and 24 UNION select idCzekoladki, nazwa, masa, koszt from czekoladki where koszt between 0.15 and 0.24;

--3.4.2 masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr
select idCzekoladki, nazwa, masa, koszt from czekoladki where masa between 25 and 35 EXCEPT select idCzekoladki, nazwa, masa, koszt from czekoladki where koszt between 0.25 and 0.35;

--3.4.3 masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr
select idczekoladki, nazwa, masa, koszt from czekoladki where masa between 15 and 24 and koszt between 0.15 and 0.24 UNION select idczekoladki, nazwa, masa, koszt from czekoladki where masa between 25 and 35 and koszt between 0.25 and 0.35;

--3.4.4 ★ masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr
select idczekoladki, nazwa, masa, koszt from czekoladki where masa between 15 and 24 INTERSECT select idczekoladki, nazwa, masa, koszt from czekoladki where koszt between 0.15 and 0.24;

--3.4.5 ★ masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 29 do 35 gr.
select idczekoladki, nazwa, masa, koszt from czekoladki where masa between 25 and 35 EXCEPT select idczekoladki, nazwa, masa, koszt from czekoladki where koszt between 0.15 and 0.24 or koszt between 0.29 and 0.35;


--3.5.1 identyfikatory klientów, którzy nigdy nie złożyli żadnego zamówienia
select idklienta from klienci except select idklienta from zamowienia;

--3.5.2 identyfikatory pudełek, które nigdy nie zostały zamówione
select idpudelka from pudelka except select idpudelka from artykuly;

--3.5.3 ★ nazwy klientów, czekoladek i pudełek, które zawierają rz (lub Rz)
select nazwa from klienci where nazwa similar to '(%rz%|%Rz%)' union select nazwa from czekoladki where nazwa similar to '(%rz%|%Rz%)' union select nazwa from pudelka where nazwa similar to '(%rz%|%Rz%)';

--3.5.4 ★ identyfikatory czekoladek, które nie występują w żadnym pudełku.
select idczekoladki from czekoladki except select idczekoladki from zawartosc;


--3.6.1 identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości,
select idmeczu, (select sum(a) from UNNEST(gospodarze) a), (select sum(b) from UNNEST(goscie) b) from siatkowka.statystyki;

--3.6.2 identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości, dla meczów, które skończyły się po 5 setach i zwycięzca ostatniego seta zdobył ponad 15 punktów,
select idmeczu, (select sum(a) from UNNEST(gospodarze) a), (select sum(b) from UNNEST(goscie) b) from siatkowka.statystyki where array_length(gospodarze, 1) = 5 and (gospodarze[5] > 15 or goscie[5] > 15);

--3.6.3 identyfikator i wynik meczu w formacie x:y, np. 3:1 (wynik jest pojedynczą kolumną – napisem),
select idmeczu, (select '3:' || to_char(array_length(gospodarze, 1) - 3, 'fm9')) from statystyki;

--3.6.4 ★ identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości, dla meczów, w których gospodarze zdobyli ponad 100 punktów,
select idmeczu, (select sum(a) from UNNEST(gospodarze) a) as "gospodarze", (select sum(b) from UNNEST(goscie) b) as "goście" from siatkowka.statystyki where (select sum(a) from UNNEST(gospodarze) a) > 100;

--3.6.5 ★ identyfikator meczu, liczbę punktów zdobytych przez gospodarzy w pierwszym secie, sumę punktów zdobytych w meczu przez gospodarzy, dla meczów, w których pierwiastek kwadratowy z liczby punktów zdobytych w pierwszym secie jest mniejszy niż logarytm o podstawie 2 z sumy punktów zdobytych w meczu. ;)
select idmeczu, sqrt(gospodarze[1]) as "gospodarze 1szy set",log(2, (select sum(b) from UNNEST(gospodarze) b) + (select sum(c) from UNNEST(goscie) c)) as "gospodarze cały mecz" from siatkowka.statystyki where sqrt(gospodarze[1] + goscie[1]) < log(2, ((select sum(a) from UNNEST(gospodarze) a) + (select sum(b) from UNNEST(goscie) b)));


--3.7.1 ★ Napisz skrypt składający się z poleceń psql, który wykona zapytanie (użyj dowolnego zapytania z zadania 3.6) oraz zwróci jego wynik jako dokument HTML (nie zapomnij o znacznikach html, body itd.), gdzie odpowiedź serwera będzie tabelą HTML.
\H
\echo <html>
\echo <head><meta charset="utf-8"></head>
\echo <body>
select idmeczu, sqrt(gospodarze[1]) as "gospodarze 1szy set",log(2, (select sum(b) from UNNEST(gospodarze) b) + (select sum(c) from UNNEST(goscie) c)) as "gospodarze cały mecz" from siatkowka.statystyki where sqrt(gospodarze[1] + goscie[1]) < log(2, ((select sum(a) from UNNEST(gospodarze) a) + (select sum(b) from UNNEST(goscie) b)));
\echo </body>
\echo </html>


--3.8.1 ★ Napisz skrypt składający się z poleceń psql, który wykona zapytanie (użyj dowolnego zapytania z zadania 3.6, ale innego niż w zadaniu 3.7) oraz zwróci jego wynik jako dokument tekstowy z polami oddzielonymi przecinkami (Comma Separated Values), z jednym rekordem w jednej linii.
\f ','
\a
\t
\o wynik.txt
select idmeczu, (select sum(a) from UNNEST(gospodarze) a) as "gospodarze", (select sum(b) from UNNEST(goscie) b) as "goście" from siatkowka.statystyki where (select sum(a) from UNNEST(gospodarze) a) > 100;
