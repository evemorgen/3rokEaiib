-- 12.1.1 Utwórz (i przetestuj działanie) wyzwalacz (w schemacie kwiaciarnia), który przy złożeniu zamówienia przez klienta:
-- oblicza rabat dla sprzedającego (użyj funkcji z zadania 11.7) i modyfikuje pole cena w dodawanym rekordzie,
-- zmniejsza liczbę dostępnych kompozycji w tabeli kompozycje,
-- dodaje rekord do tabeli zapotrzebowanie, jeśli stan danej kompozycji spada poniżej stanu minimalnego.
create or replace function do_trigera()
returns trigger
language plpgsql
as $$
    declare
        rabacik int;
        zaop record;
    begin
        select rabat(NEW.idklienta) into rabacik;
        update kompozycje set stan = stan - 1 where idkompozycji = NEW.idkompozycji;
        select * into zaop from kompozycje where idkompozycji = NEW.idkompozycji;
        IF zaop.stan < zaop.minimum THEN
            insert into zapotrzebowanie values (NEW.idkompozycji, NOW());
        END IF;
        return null;
    end;
$$;
create trigger zlozenie_zamowienia after insert on zamowienia for each row execute procedure do_trigera();

-- 12.1.2 ★ Utwórz wyzwalacz (w schemacie kwiaciarnia), który automatycznie usuwa rekordy z tabeli zapotrzebowanie, jeżeli po dostawie (after update) wzrasta stan danej kompozycji powyżej minimum. Przetestuj działanie wyzwalacza.
create or replace function do_trigera2()
returns trigger
language plpgsql
as $$
    begin
        IF NEW.stan >= NEW.minimum THEN
            delete from zapotrzebowanie where idkompozycji = NEW.idkompozycji;
        END IF;
        return null;
    end;
$$;
create trigger update_zaopatrzenia after update on kompozycje for each row execute procedure do_trigera2();


-- 12.2.1 Utwórz wyzwalacz modyfikujący (przy wstawianiu i aktualizacji rekordów w tabeli pudelka) pole cena w tabeli pudelka, jeżeli cena jest mniejsza niż 105% kosztów wytworzenia danego pudełka czekoladek (koszt wytworzenia czekoladek + koszt pudełka 0,90 zł). W takim przypadku cenę należy ustawić na kwotę 105% kosztów wytworzenia.
select 'not gonna lie but this shit is same as from 1st exc...';

-- 12.2.2 ★ Utwórz wyzwalacz modyfikujący (przy wstawianiu i aktualizacji rekordów w tabeli zawartosc) pole cena w tabeli pudelka, jeżeli cena jest mniejsza niż 105% kosztów wytworzenia danego pudełka czekoladek (koszt wytworzenia czekoladek + koszt pudełka 0,90 zł). W takim przypadku cenę należy ustawić na kwotę 105% kosztów wytworzenia.
select 'not gonna lie but this shit is same as from 1st exc...';

-- 12.2.3 ★ Utwórz wyzwalacz modyfikujący (przy aktualizacji rekordów w tabeli czekoladki) pole cena w tabeli pudelka, jeżeli cena jest mniejsza niż 105% kosztów wytworzenia danego pudełka czekoladek (koszt wytworzenia czekoladek + koszt pudełka 0,90 zł). W takim przypadku cenę należy ustawić na kwotę 105% kosztów wytworzenia.
select 'not gonna lie but this shit is same as from 1st exc...';


-- 12.3.1 Rozpocznij transakcję: begin.
begin;
-- 12.3.2 Wykonaj szereg dowolnych zapytań DML (insert/update/delete).
insert into klienci values ('aaaaaaa', 'dupa', 'Hello Moto', 'Sosnowiec', null, 'a', 'a', 'b', null, null, null);
-- 12.3.3 Sprawdź czy efekty w/w zapytań są widoczne w bazie danych (w tej samej sesji oraz w nowo utworzonej sesji).
select * from klienci where idklienta = 'aaaaaaa';
 idklienta | haslo |   nazwa    |  miasto   | kod | adres | email | telefon | fax | nip | regon
-----------+-------+------------+-----------+-----+-------+-------+---------+-----+-----+-------
 aaaaaaa   | dupa  | Hello Moto | Sosnowiec |     | a     | a     | b       |     |     |
(1 row)
-- 12.3.4 Anuluj transakcję: rollback.
rollback;
-- 12.3.5 Sprawdź czy efekty zapytań z punktu 3 są wciąż widoczne w bazie danych (w tej samej sesji oraz w nowo utworzonej sesji).
select * from klienci where idklienta = 'aaaaaaa';
 idklienta | haslo | nazwa | miasto | kod | adres | email | telefon | fax | nip | regon
-----------+-------+-------+--------+-----+-------+-------+---------+-----+-----+-------
(0 rows)
-- 12.3.6 Powtórz kroki 1-3. Zatwierdź transakcję: commit.
galcpatr=> begin;
BEGIN
galcpatr=> insert into klienci values ('aaaaaaa', 'dupa', 'Hello Moto', 'Sosnowiec', null, 'a', 'a', 'b', null, null, null);
INSERT 0 1
galcpatr=> commit;
COMMIT
-- 12.3.7 Sprawdź czy efekty zapytań z punktu 6 są wciąż widoczne w bazie danych (w tej samej sesji oraz w nowo utworzonej sesji).
galcpatr=> select * from klienci where idklienta = 'aaaaaaa';
 idklienta | haslo |   nazwa    |  miasto   | kod | adres | email | telefon | fax | nip | regon
-----------+-------+------------+-----------+-----+-------+-------+---------+-----+-----+-------
aaaaaaa   | dupa  | Hello Moto | Sosnowiec |     | a     | a     | b       |     |     |
(1 row)

-- 12.3.8 ★ wykonaj powyższe testy zmieniając poziom izolacji transakcji http://www.postgresql.org/docs/9.1/static/sql-set-transaction.html.
select 'fajne ale nie';.


-- 12.4.1 Udziel dostępu do wykonywania zapytań select 2-giej osobie w grupie do tabeli kompozycje (schemat kwiaciarnia); przetestuj.
grant select on kompozycje to dudaszym;

-- 12.4.2 Udziel dostępu do wykonywania zapytań select 2-giej osobie w grupie do schematu firma; przetestuj.
grant select on all tables in schema firma to dudaszym;

-- 12.4.3 Udziel dostępu do dodawania, usuwania, modyfikacji wierszy 2-giej osobie w grupie do tabeli klienci (schemat kwiaciarnia); przetestuj.
grant insert, update, delete on klienci to dudaszym;

-- 12.4.4 Zezwól 2-giej osobie na tworzenie nowych obiektów w schemacie firma; przetestuj.
grant create on schema firma to dudaszym;
-- 12.4.5 Powtórz ćwiczenie zamieniając się rolami.
nie mam koleguf :c
-- 12.4.6 Usuń przyznane prawa. Sprawdź, czy 2-ga osoba może teraz wykonać jakieś operacje.
revoke select on kompozycje from dudaszym;
revoke select on all tables in schema firma from dudaszym;
revoke insert, update, delete on klienci from dudaszym;
revoke create on schema firma from dudaszym;


-- 12.5.1 Utwórz widok (perspektywę), który zwraca: identyfikator zamówienia, datę realizacji, nazwę i adres klienta dla każdego zamówienia - zapytanie takie może być używane np. przez dział wysyłki.
create view DzialWysylki as select idzamowienia, datarealizacji, nazwa, ulica, miejscowosc from zamowienia natural join klienci ;
select * from dzialWysylki;
-- 12.5.2 Udostępnij widok z poprzedniego zadania innemu użytkownikowi do odczytu (pracownikowi działu zamówień ;))
grant select on dzialwysylki to dudaszym;


-- 12.6.1 Wykonaj kopie zapasową wszystkich schematów Twojej bazy danych wykorzystując polecenie pg_dump. Przećwicz opcje: -a oraz –inserts. Zobacz co jest rezultatem działania w/w polecenia. Jak odtworzyć taką kopię?
pg_dump --inserts -f ja.sql galcpatr
psql -f ja.sql

-- 12.6.2 ★ Wykonaj kopie danych Internetowej Kwiaciarni (uwaga: tylko dane i obiekty z jej schematu).
pg_dump --a -f kwiatki.sql --schema kwiaciarnia galcpatr

-- 12.6.3 ★ Odtwórz kwiaciarnię w innym schemacie.
create schema dupa;
set schema 'dupa';
%s/kwiaciarnia/cokolwiek/gc
psql -f kwiatki.sql
