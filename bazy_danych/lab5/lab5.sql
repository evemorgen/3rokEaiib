--5.1.1 łącznej liczby czekoladek w bazie danych,
select count(*) from czekoladki;

--5.1.2 łącznej liczby czekoladek z nadzieniem (na 2 sposoby) - podpowiedź: count(*), count(nazwaKolumny)
select count(*) from czekoladki where nadzienie is not null;
select count(nadzienie) from czekoladki;

--5.1.3 pudełka, w którym jest najwięcej czekoladek (uwaga: konieczne jest użycie LIMIT)
select *, (select sum(sztuk) from zawartosc group by idpudelka order by sum(sztuk) desc limit 1) as "sztuk" from pudelka where idpudelka = (select idpudelka from zawartosc group by idpudelka order by sum(sztuk) DESC limit 1);

--5.1.4 ★ łącznej liczby czekoladek w poszczególnych pudełkach,
select idpudelka, sum(sztuk) from zawartosc group by idpudelka;

--5.1.5 ★ łącznej liczby czekoladek bez orzechów w poszczególnych pudełkach,
select idpudelka, sum(sztuk) from zawartosc natural join czekoladki where orzechy is null group by idpudelka;

--5.1.6 ★ łącznej liczby czekoladek w mlecznej czekoladzie w poszczególnych pudełkach.
select idpudelka, sum(sztuk) from zawartosc natural join czekoladki where czekolada = 'mleczna' group by idpudelka;


--5.2.1 masy poszczególnych pudełek,
select idpudelka, sum(masa*sztuk) as "masa pudełka" from zawartosc natural join czekoladki group by idpudelka;

--5.2.2 pudełka o największej masie
select idpudelka, sum(masa*sztuk) as "masa pudełka" from zawartosc natural join czekoladki group by idpudelka order by sum(masa*sztuk) DESC limit 1;
select * from pudelka where idpudelka = (select idpudelka from zawartosc natural join czekoladki group by idpudelka order by sum(masa*sztuk) desc limit 1);

--5.2.3 ★ średniej masy pudełka w ofercie cukierni,
select avg(sum) from (select sum(masa*sztuk) from zawartosc natural join czekoladki group by idpudelka) foo;

--5.2.4 ★ średniej wagi pojedynczej czekoladki w poszczególnych pudełkach
select p.nazwa, p.idpudelka, avg(masa) from zawartosc natural join czekoladki join pudelka p on zawartosc.idpudelka = p.idpudelka group by p.idpudelka;


--5.3.1 liczby zamówień na poszczególne dni
select datarealizacji, count(idzamowienia) from zamowienia group by datarealizacji;

--5.3.2 łącznej liczby wszystkich zamówień
select count(idzamowienia) as "ilość zamówień" from zamowienia;

--5.3.3. ★ łącznej wartości wszystkich zamówień
select sum(sumka) from (select sum(sztuk*cena) as "sumka" from artykuly natural join pudelka group by idzamowienia) as foo;

--5.3.4 ★ klientów, liczby złożonych przez nich zamówień i łącznej wartości złożonych przez nich zamówień
???


--5.4.1 czekoladki, która występuje w największej liczbie pudełek
select * from czekoladki where idczekoladki = (select idczekoladki from zawartosc group by idczekoladki order by count(idpudelka) DESC limit 1);

--5.4.2 pudełka, które zawiera najwięcej czekoladek bez orzechów
select * from pudelka where idpudelka = (select idpudelka from zawartosc natural join czekoladki where orzechy is null group by idpudelka order by sum(sztuk) DESC limit 1);

--5.4.3 ★ czekoladki, która występuje w najmniejszej liczbie pudełek,
select * from czekoladki where idczekoladki = (select idczekoladki from zawartosc group by idczekoladki order by count(idpudelka) ASC limit 1);

--5.4.4 ★ pudełka, które jest najczęściej zamawiane przez klientów.
select * from pudelka where idpudelka = (select idpudelka from artykuly group by idpudelka order by count(idzamowienia) DESC limit 1);


--5.5.1 liczby zamówień na poszczególne kwartały,
select count(idzamowienia) from zamowienia group by extract(quarter from datarealizacji);

--5.5.2 liczby zamówień na poszczególne miesiące
select date_part('month', datarealizacji), count(idzamowienia) from zamowienia group by date_part('month', datarealizacji);

--5.5.3 ★ liczby zamówień do realizacji w poszczególnych tygodniach
select extract(week from datarealizacji) as tygodnie, count(idzamowienia) from zamowienia group by tygodnie;

--5.5.4 ★ liczby zamówień do realizacji w poszczególnych miejscowościach
select miejscowosc, count(idzamowienia) from zamowienia natural join klienci group by miejscowosc;


--5.6.1 łącznej masy wszystkich pudełek czekoladek znajdujących się w cukierni,
select sum(sumcia) as "MASA" from (select sum(masa*sztuk) as "sumcia" from zawartosc join czekoladki using(idczekoladki) group by idpudelka) as dupa;

--5.6.2 ★ łącznej wartości wszystkich pudełek czekoladek znajdujących się w cukierni
select sum(piniadze) as "PINIĄDZE" from (select sum(sztuk*cena) as piniadze from artykuly natural join pudelka group by idpudelka) as dupa;


--5.7.1 zysk ze sprzedaży jednej sztuki poszczególnych pudełek (różnica między ceną pudełka i kosztem jego wytworzenia)
select pudelka.nazwa, sum(koszt*sztuk) as "produkcja", cena as "cena pudełka", (cena - sum(koszt*sztuk)) as "zysk" from zawartosc join czekoladki using(idczekoladki) join pudelka using(idpudelka) group by idpudelka, pudelka.nazwa, pudelka.cena;

--5.7.2 zysk ze sprzedaży zamówionych pudełek
select sum(zysk_z_pudelka) from (select sum(sztuk*z.zysk) as "zysk_z_pudelka" from artykuly join (select pudelka.idpudelka, (cena - sum(koszt*sztuk)) as "zysk" from zawartosc join czekoladki using(idczekoladki) join pudelka using(idpudelka) group by idpudelka, pudelka.idpudelka, pudelka.cena) as z using(idpudelka) group by idzamowienia) as dupa;

--5.7.3 ★ zysk ze sprzedaży wszystkich pudełek czekoladek w cukierni
select sum(zysk) from(select (cena - sum(koszt*sztuk))*stan as "zysk" from zawartosc join czekoladki using(idczekoladki) join pudelka using(idpudelka) group by idpudelka, pudelka.cena, pudelka.stan) as dupa;


--5.8.1 Napisz zapytanie wyświetlające: liczbę porządkową i identyfikator pudełka czekoladek (idpudelka). Identyfikatory pudełek mają być posortowane alfabetycznie, rosnąco. Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.
NIE ROZUMIEM.


