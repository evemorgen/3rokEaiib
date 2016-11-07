5.1.1 łącznej liczby czekoladek w bazie danych,
select count(*) from czekoladki;

5.1.2 łącznej liczby czekoladek z nadzieniem (na 2 sposoby) - podpowiedź: count(*), count(nazwaKolumny)
select count(*) from czekoladki where nadzienie is not null;
select count(nadzienie) from czekoladki;

5.1.3 pudełka, w którym jest najwięcej czekoladek (uwaga: konieczne jest użycie LIMIT)
select * from pudelka natural join zawartosc order by sztuk desc limit 1;

5.2.1 masy poszczególnych pudełek,
select idpudelka, sum(masa) as "masa pudełka" from zawartosc natural join czekoladki group by idpudelka;

5.2.2 pudełka o największej masie
select idpudelka, sum(masa) as "masa pudełka" from zawartosc natural join czekoladki group by idpudelka order by sum(masa) DESC limit 1;

5.3.1 liczby zamówień na poszczególne dni
select datarealizacji, count(idzamowienia) from zamowienia group by datarealizacji;

5.3.2 łącznej liczby wszystkich zamówień
select count(idzamowienia) as "ilość zamówień" from zamowienia ;

5.4.1 czekoladki, która występuje w największej liczbie pudełek
select * from czekoladki where idczekoladki = (select idczekoladki from zawartosc group by idczekoladki order by count(idpudelka) DESC limit 1);

5.4.2 pudełka, które zawiera najwięcej czekoladek bez orzechów
select * from pudelka where idpudelka = (select idpudelka from zawartosc natural join czekoladki where orzechy is null group by idpudelka order by sum(sztuk) DESC limit 1);


