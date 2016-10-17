\H
\echo <html>
\echo <head><meta charset="utf-8"></head>
\echo <body>
select idmeczu, sqrt(gospodarze[1]) as "gospodarze 1szy set",log(2, (select sum(b) from UNNEST(gospodarze) b) + (select sum(c) from UNNEST(goscie) c)) as "gospodarze cały mecz" from siatkowka.statystyki where sqrt(gospodarze[1] + goscie[1]) < log(2, ((select sum(a) from UNNEST(gospodarze) a) + (select sum(b) from UNNEST(goscie) b)));
\echo </body>
\echo </html>
