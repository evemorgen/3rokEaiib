1. wyświetla listę klientów (nazwa, ulica, miejscowość) posortowaną według nazw klientów
select nazwa, ulica, miejscowosc from klienci order by nazwa;

2. wyświetla listę klientów posortowaną malejąco według nazw miejscowości, a w ramach tej samej miejscowości rosnąco według nazw klientów,
select nazwa, ulica, miejscowosc from klienci order by miejscowosc DESC, nazwa ASC;

3. wyświetla listę klientów z Krakowa lub z Warszawy posortowaną malejąco według nazw miejscowości, a w ramach tej samej miejscowości rosnąco według nazw klientów (zapytanie utwórz na dwa sposoby stosując w kryteriach or lub in).
select nazwa, ulica, miejscowosc from klienci where miejscowosc = 'Kraków' or miejscowosc = 'Warszawa' order by miejscowosc DESC, nazwa ASC;
select nazwa, ulica, miejscowosc from klienci where miejscowosc in ('Kraków', 'Warszawa') order by miejscowosc DESC, nazwa ASC;

4. wyświetla listę klientów posortowaną malejąco według nazw miejscowości,
select nazwa, ulica, miejscowosc from klienci order by miejscowosc DESC;

5. wyświetla listę klientów z Krakowa posortowaną według nazw klientów.
select nazwa, ulica, miejscowosc from klienci where miejscowosc = 'Kraków' order by nazwa;

6. wyświetla nazwę i masę czekoladek, których masa jest większa niż 20 g,
select nazwa, masa from czekoladki where masa > 20;

7. wyświetla nazwę, masę i koszt produkcji czekoladek, których masa jest większa niż 20 g i koszt produkcji jest większy niż 25 gr,
select nazwa, masa, koszt from czekoladki where masa > 20 and koszt > 0.25;

8. j.w. ale koszt produkcji musi być podany w groszach,
select nazwa, masa, koszt*100 as "cebule" from czekoladki where masa > 20 and koszt > 0.25;

9. wyświetla nazwę oraz rodzaj czekolady, nadzienia i orzechów dla czekoladek, które są w mlecznej czekoladzie i nadziane malinami lub są w mlecznej czekoladzie i nadziane truskawkami lub zawierają orzechy laskowe, ale nie są w gorzkiej czekoladzie,
select nazwa, czekolada, nadzienie, orzechy from czekoladki where (czekolada = 'mleczna' and nadzienie = 'maliny') or (czekolada = 'mleczna' and nadzienie = 'truskawki') or (orzechy = 'laskowe' and czekolada != 'gorzka');

10. wyświetla nazwę i koszt produkcji czekoladek, których koszt produkcji jest większy niż 25 gr,
select nazwa, koszt from czekoladki where koszt > 0.25;

11. wyświetla nazwę i rodzaj czekolady dla czekoladek, które są w białej lub mlecznej czekoladzie.
select nazwa, czekolada from czekoladki where czekolada in ('mleczna', 'biała');

12. 124 * 7 + 45,
select 124 * 7 + 45;

13. 2 ^ 20,
select 2 ^ 20;

14. ★ √3,
select sqrt(3);

15. ★ π.
select pi();

16. masa mieści się w przedziale od 15 do 24 g,
select IDCzekoladki, Nazwa, Masa, Koszt from czekoladki where masa > 15 and masa < 24;

17. koszt produkcji mieści się w przedziale od 25 do 35 gr,
select IDCzekoladki, Nazwa, Masa, Koszt from czekoladki where koszt > 0.25 and koszt < 0.35;

18. ★ masa mieści się w przedziale od 25 do 35 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr.
select IDCzekoladki, Nazwa, Masa, Koszt from czekoladki where (koszt > 0.25 and koszt < 0.35) or (masa > 25 and masa < 35);

19. zawierają jakieś orzechy,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null;

20. nie zawierają orzechów,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is null;

21. zawierają jakieś orzechy lub jakieś nadzienie,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where (orzechy is not null) or (nadzienie is not null);

22. są w mlecznej lub białej czekoladzie (użyj IN) i nie zawierają orzechów,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where czekolada in ('mleczna', 'biała') and orzechy is null;

23. nie są ani w mlecznej ani w białej czekoladzie i zawierają jakieś orzechy lub jakieś nadzienie,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where (czekolada not in ('mleczna', 'biała')) and (orzechy is not null or nadzienie is not null);

24. ★ zawierają jakieś nadzienie,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nadzienie is not null;

25. ★ nie zawierają nadzienia,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nadzienie is null;

26. ★ nie zawierają orzechów ani nadzienia,
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nadzienie is null and orzechy is null;

27. ★ są w mlecznej lub białej czekoladzie i nie zawierają nadzienia.
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nadzienie is null and czekolada in ('biała', 'mleczna');

28. masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr,
select nazwa, masa, koszt from czekoladki where masa between 15 and 24 or koszt between 0.15 and 0.24;

29. masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr,
select nazwa, masa, koszt from czekoladki where (masa between 15 and 24 and koszt between 0.15 and 0.24) or (masa between 25 and 35 and koszt between 0.25 and 0.35);

30. ★ masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr,
select nazwa, masa, koszt from czekoladki where masa between 15 and 24 and koszt between 0.15 and 0.24;

31. ★ masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr,
select nazwa, masa, koszt from czekoladki where masa between 25 and 35 and koszt not between 0.25 and 0.3;

32. ★ masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 25 do 35 gr.
select nazwa, masa, koszt from czekoladki where masa between 25 and 35 and koszt not between 0.25 and 0.35 and koszt not between 0.15 and 0.24;
