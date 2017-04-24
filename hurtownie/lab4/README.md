# Hurtownie danych - lab 4

Strona prowadzącego: [Hurtownie Sędziwy](http://galaxy.agh.edu.pl/~sedziwy/wordpress/?page_id=1436),
hasło do treści: [`h12017`]()

### Projekt
1. 40% oceny końcowej
2. bierzemy excela z pierwszych zajęć i robimy hurtownie z tych danych (+ napisać jeżeli czegoś brakuje to dołożyć wirtualne dane), schamat + opis czego używamy itd
3. oceniana będzie poprawność kostki (zgodność z zasadami z zajęć) i "przydatność na produkcji)
4. zaproponować trójwymiarową kostkę (BEZ TEGO NIE DOSTANIESZ ZALICZENIA CEPIE)
5. wysyłamy na porzycki małpka agh.edu.pl to do 8 maja, 23:55 i ani minuty dłużej


### OLAP (OnLine Analytical Processing)
dzieli się na:
  - ROLAP
      - relational OLAP
      - nie jest webscale (lol) (nie skaluje się)
  - MOLAP
      - multidimensional OLAP
      - zazwyczaj NoSQL, redundancja itd (to wszystko z poprzednich zajęć)
  - HOLAP
      - Hybrid OLAP
      - rozwiązanie pośrednie, mieszanka MOLAP i ROLAP

### Istnieje taki byt jak "Kostka OLAP"
![Olap Dice](http://www.elml.uzh.ch/preview/fois/DSSII/en/image/13_2_4_g9.jpg)
Operacje na kostce:
  - konsolidacja (roll-up)
  - Eksploracja ( drill-down)
  - Krojenie (slice)
  - selekcja (dice)


porównanie MOLAP ROLAP

Model relacyjny
| kw | miasto   | sprzedaż |
|----|----------|----------|
| 1  | Kraków   | 1000     |
| 2  | Kraków   | 1000     |
| 3  | Kraków   | 1500     |
| 4  | Kraków   | 1720     |
| 1  | Warszawa | 500      |
| 2  | Warszawa | 2000     |
| 3  | Warszawa | 2500     |
| 4  | Warszawa | 720      |
| 1  | Cośtam   | 1000     |

Model nie relacyjny (na kostce)
| kw\ecna   | 1000   | 500      | 1000   | cena/rodzaj   |
|-----------|--------|----------|--------|---------------|
| 1         | 2000   | 2000     | ...    |               |
| 2         |        |          |        |               |
| 3         |        |          |        |               |
| 4         |        |          |        |               |
|2016    | 3000 | 2500 | 1000 |               |
| kw\miasto | Kraków | Warszawa | Cośtam | miasto\rodzaj |
