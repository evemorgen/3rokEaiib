# Hurtownie danych - lab 3

Strona prowadzącego: [Hurtownie Sędziwy](http://galaxy.agh.edu.pl/~sedziwy/wordpress/?page_id=1436),
hasło do treści: [`h12017`]()

### Metoda 9 kroków keepala

1. Wybór procesu
    - wybieramy podmiot działalności przedsiębiorstwa, z którego powstanie tabela faktów
    - uporządkować według możliwości realizacji (wtf?)
    - ważności dla klienta
2. Wybór poziomu szczegółowości
    - od tego zależy poziom szczegółowości całej hurtowni
    - musi zostać zachowana konsekwencja w stosunku do tabel poniżej
    - np czy wpisujemy
3. Identyfikacja i uzgodnienie wymiaru
    - dla konkretnego faktu wybieramy konkretne wymiary
4. Wybór faktów
    - określamy jakie fakty będą trzymane w tabeli faktów
5. Umieszczenie wstępnych obliczeń w tablicy faktów
    - np znamy cenę i stawkę podatku, z tego możemy obliczyć cene brutto, cene netto itd (dane będą redundantne ale przyspieszą wybieranie z tabeli)
6. Zaokrąglenie tabeli wymiarów (nieudolne tłumaczenie)
    - dodanie pól opisowych
    - dodanie dodatkowych metadanych opisowych
    - opisy powinny być intuicyjne i zrozumiałe dla biznesu, lol
    - im więcej atrybutów tym lepiej
    - obrabiamy "raw" dane i robimy je bardziej zrozumiałe dla końcowego usera "round data"
7. Wybór zakresu czasowego
    - mamy już wszystkie dane i wybieramy zakres czasowy w którym mamy dane
    - trzeba podjąć decyzję co do zakresu ze względu na kompletność danych
8. Śledzenie wolno zmieniających się wymiarów
    - jeżeli wymiar zmienia się, można:
         1. robimy update na całej tabeli
         2. wpisujemy nową wartość do tabeli
         3. tworzymy nową tabelę wymiarów
9. Określenie priorytetów i trybów zapytań
    - optymalizacja hurtowni pod konkretne zapytania

nie zapominamy o zachowaniu poziomu szczegółowości dla wszystkich tabel

dane powinny być addytywne (powinny móc się dodawać)
- dobry przykład - cena brutto towaru
- zły przykład - stawka podatku wat
