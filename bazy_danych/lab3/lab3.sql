1. Data zamowienia pomiędzy 12 i 20 listopada 2013
select idZamowienia, dataRealizacji from zamowienia where dataRealizacji between '2013-11-12' and '2013-11-20';

2. między 1 i 6 grudnia lub 15 i 20 grudnia 2013
select idZamowienia, dataRealizacji from zamowienia where dataRealizacji between '2013-12-01' and '2013-12-06' or dataRealizacji between '2013-12-15' and '2013-12-20';

3. W listopadzie 2013
select idZamowienia, dataRealizacji from zamowienia where date_part('month', dataRealizacji) = 11;
select idZamowienia, dataRealizacji from zamowienia where extract(month from dataRealizacji) = 11;

3.2.1
Rozpoczyna się na S
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'S%';

3.2.2
Rozpoczyna się na S i kończy na i
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'S%i';

3.2.3
rozpoczyna się na literę 'S' i zawiera słowo rozpoczynające się na literę 'm',
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa like 'S% m%';

3.2.4
rozpoczyna się na literę 'A', 'B' lub 'C',
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '(A|B|C)%';

3.2.5
zawiera rdzeń 'orzech' (może on wystąpić na początku i wówczas będzie pisany z wielkiej litery),
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '(O|%o)rzech%';

3.3.1
wyświetla nazwy miast, z których pochodzą klienci cukierni i które składają się z więcej niż jednego słowa,
select miejscowosc from klienci where miejscowosc like '% %';

3.3.2
wyświetla nazwy klientów, którzy podali numer stacjonarny telefonu,
select nazwa from klienci where telefon like '012%';

3.4.1
masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr,
select idCzekoladki, nazwa, masa, koszt from czekoladki where masa between 15 and 24 UNION select idCzekoladki, nazwa, masa, koszt from czekoladki where koszt between 0.15 and 0.24;

3.4.2
masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr,
select idCzekoladki, nazwa, masa, koszt from czekoladki where masa between 25 and 35 EXCEPT select idCzekoladki, nazwa, masa, koszt from czekoladki where koszt between 0.25 and 0.35;

3.4.3
masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr,


3.5.1
identyfikatory klientów, którzy nigdy nie złożyli żadnego zamówienia,
select idklienta from klienci except select idklienta from zamowienia;

3.5.2
identyfikatory pudełek, które nigdy nie zostały zamówione,
select idpudelka from artykuly except select idpudelka from pudelka;
