\f ','
\a
\t
\o wynik.txt
select idmeczu, (select sum(a) from UNNEST(gospodarze) a) as "gospodarze", (select sum(b) from UNNEST(goscie) b) as "goście" from siatkowka.statystyki where (select sum(a) from UNNEST(gospodarze) a) > 100;
