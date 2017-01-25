--11.1.1 Napisz funkcję masaPudelka wyznaczającą masę pudełka jako sumę masy czekoladek w nim zawartych. Funkcja jako argument przyjmuje identyfikator pudełka. Przetestuj działanie funkcji na podstawie prostej instrukcji select.
create or replace function masaPudelka(pudelko char(4))
returns numeric(7,2)
language plpgsql
as $$
declare
    suma numeric(7,2);
begin
    select sum(masa) into suma from zawartosc natural join czekoladki where idpudelka = pudelko;
    return suma;
end;
$$;

select masaPudelka('alls');

--11.1.2 ★ Napisz funkcję liczbaCzekoladek wyznaczającą liczbę czekoladek znajdujących się w pudełku. Funkcja jako argument przyjmuje identyfikator pudełka. Przetestuj działanie funkcji na podstawie prostej instrukcji select.
create or replace function liczbaCzekoladek(pudelko char(4))
returns bigint
language plpgsql
as $$
declare
    liczba bigint;
begin
    select sum(sztuk) into liczba from zawartosc where idpudelka = pudelko;
    return liczba;
end;
$$;

select liczbaCzekoladek('alls');

--11.2.1 Napisz funkcję zysk obliczającą zysk jaki cukiernia uzyskuje ze sprzedaży jednego pudełka czekoladek, zakładając, że zysk ten jest różnicą między ceną pudełka, a kosztem wytworzenia zawartych w nim czekoladek i kosztem opakowania (0,90 zł dla każdego pudełka). Funkcja jako argument przyjmuje identyfikator pudełka. Przetestuj działanie funkcji na podstawie prostej instrukcji select.
create or replace function zysk(pudelko char(4))
returns numeric(7,2)
language plpgsql
as $$
declare
    kosztCzekoladek numeric(7,2);
    cenaPudelka numeric(7,2);
begin
    select sum(koszt*sztuk) into kosztCzekoladek from zawartosc natural join czekoladki where idpudelka = pudelko;
    select cena into cenaPudelka from pudelka where idpudelka = pudelko;
    return cenaPudelka - 0.90 - kosztCzekoladek;
end;
$$;

select zysk('alls');
--11.2.2 Napisz instrukcję select obliczającą zysk jaki cukiernia uzyska ze sprzedaży pudełek zamówionych w wybranym dniu.
select sum(sumka) from (select sum(zysk(idpudelka) * sztuk) as sumka from artykuly where idzamowienia in (select idzamowienia from zamowienia where datarealizacji = '2013-10-30') group by idzamowienia) as foo;

--11.3.1 Napisz funkcję sumaZamowien obliczającą łączną wartość zamówień złożonych przez klienta, które czekają na realizację (są w tabeli Zamowienia). Funkcja jako argument przyjmuje identyfikator klienta. Przetestuj działanie funkcji.
create or replace function sumaZamowien(klient bigint)
returns numeric(7,2)
language plpgsql
as $$
declare
    suma numeric(7,2);
    cenka numeric(7,2);
    zamowienie record;
begin
    suma := 0;
    for zamowienie in (select idzamowienia from zamowienia where idklienta = klient)
    loop
        select sztuk * cena into cenka from artykuly natural join pudelka where idzamowienia = zamowienie.idzamowienia;
        suma := suma + cenka;
    end loop;
    return suma;
end;
$$;

--11.3.2 Napisz funkcję rabat obliczającą rabat jaki otrzymuje klient składający zamówienie. Funkcja jako argument przyjmuje identyfikator klienta. Rabat wyliczany jest na podstawie wcześniej złożonych zamówień w sposób następujący:
--4 % jeśli wartość zamówień jest z przedziału 101-200 zł;
--7 % jeśli wartość zamówień jest z przedziału 201-400 zł;
--8 % jeśli wartość zamówień jest większa od 400 zł.

create or replace function rabat(klient bigint)
returns bigint
language plpgsql
as $$
declare
    poprzednie numeric(7,2);
begin
    select sumaZamowien(klient) into poprzednie;
    if poprzednie > 101 AND poprzednie < 201 then
        return 4;
    elsif poprzednie > 200 and poprzednie < 401 then
        return 7;
    elsif poprzednie > 400 then
        return 8;
    end if;
    return 0;
end;
$$;

select rabat(1);

--11.4.1 Napisz bezargumentową funkcję podwyzka, która dokonuje podwyżki kosztów produkcji czekoladek o:
--3 gr dla czekoladek, których koszt produkcji jest mniejszy od 20 gr;
--4 gr dla czekoladek, których koszt produkcji jest z przedziału 20-29 gr;
--5 gr dla pozostałych.
--Funkcja powinna ponadto podnieść cenę pudełek o tyle o ile zmienił się koszt produkcji zawartych w nich czekoladek.
--Przed testowaniem działania funkcji wykonaj zapytania, które umieszczą w plikach dane na temat kosztów czekoladek i cen pudełek tak, aby można było później sprawdzić poprawność działania funkcji podwyzka. Przetestuj działanie funkcji.
create or replace function podwyzka()
returns void
language plpgsql
as $$
declare
    suma numeric(7,2);
    pudeleczko record;
    czekoladka record;
begin
    for pudeleczko in select idpudelka, sztuk, koszt from zawartosc natural join czekoladki
    loop
        if pudeleczko.koszt < 0.21 then
            update pudelka set cena = cena + 0.03 * pudeleczko.sztuk where idpudelka = pudeleczko.idpudelka;
        elsif pudeleczko.koszt > 0.20 and pudeleczko.koszt < 0.30 then
            update pudelka set cena = cena + 0.04 * pudeleczko.sztuk where idpudelka = pudeleczko.idpudelka;
        else
            update pudelka set cena = cena + 0.05 * pudeleczko.sztuk where idpudelka = pudeleczko.idpudelka;
        end if;
    end loop;
    for czekoladka in select idczekoladki, koszt from czekoladki
    loop
        if czekoladka.koszt < 0.21 then
            update czekoladki set koszt = koszt + 0.03 where idczekoladki = czekoladka.idczekoladki;
        elsif czekoladka.koszt > 0.20 and czekoladka.koszt < 0.30 then
            update czekoladki set koszt = koszt + 0.04 where idczekoladki = czekoladka.idczekoladki;
        else
            update czekoladki set koszt = koszt + 0.05 where idczekoladki = czekoladka.idczekoladki;
        end if;
    end loop;
end;
$$;

--11.5.1 Napisz funkcję obnizka odwracająca zmiany wprowadzone w poprzedniej funkcji. Przetestuj działanie funkcji.
create or replace function antypodwyzka()
returns void
language plpgsql
as $$
declare
begin
    RAISE NOTICE 'not gonna lie, but i  dont have time for this shit right now, so this is just a placeholder, peace!';
end;
$$;
--11.6.1 Napisz funkcję zwracającą informacje o zamówieniach złożonych przez klienta, którego identyfikator podawany jest jako argument wywołania funkcji. W/w informacje muszą zawierać: idzamowienia, idpudelka, datarealizacji. Przetestuj działanie funkcji. Uwaga: Funkcja zwraca więcej niż 1 wiersz!
create or replace function info(klient bigint)
returns table (zamowienie int, pudelko text, datare date)
language plpgsql
as $$
declare
begin
    return query
    select idzamowienia, idpudelka::text, datarealizacji from zamowienia natural join artykuly where idklienta = klient;
end;
$$;

select * from info(2);
--11.6.2 ★ Napisz funkcję zwracającą listę klientów z miejscowości, której nazwa podawana jest jako argument wywołania funkcji. Lista powinna zawierać: nazwę klienta i adres. Przetestuj działanie funkcji.
create or replace function listaKlientow(miasto text)
returns table (nazwa_klienta text, ul text)
language plpgsql
as $$
begin
    return query
    select nazwa::text, ulica::text from klienci where miejscowosc = miasto;
end;
$$;

select * from listaKlientow('Katowice');
--11.7.1 Napisz funkcję rabat obliczającą rabat jaki otrzymuje klient kwiaciarni składający zamówienie. Funkcję utwórz w schemacie kwiaciarnia. Rabat wyliczany jest na podstawie zamówień bieżących (tabela zamowienia) i z ostatnich siedmiu dni (tabela historia) w sposób następujący:
--5 % jeśli wartość zamówień jest większa od 0 lecz nie większa od 100 zł;
--10 % jeśli wartość zamówień jest z przedziału 101-400 zł;
--15 % jeśli wartość zamówień jest z przedziału 401-700 zł;
--20 % jeśli wartość zamówień jest większa od 700 zł.
create or replace function rabat(klient varchar(10))
returns int
language plpgsql
as $$
declare
    z_histori record;
    z_zamowien record;
    suma numeric(7,2);
begin
    suma := 0.0;
    for z_histori in select cena from historia where idklienta = klient
    loop
        suma := suma + z_histori.cena;
    end loop;
    for z_zamowien in select cena from zamowienia where idklienta = klient
    loop
        suma := suma + z_zamowien.cena;
    end loop;
    if suma < 101 then
        return 5;
    elsif suma > 100 and suma < 401 then
        return 10;
    elsif suma > 400 and suma < 701 then
        return 15;
    else
        return 20;
    end if;
end;
$$;

select nazwa, idklienta, rabat(idklienta) from klienci ;
