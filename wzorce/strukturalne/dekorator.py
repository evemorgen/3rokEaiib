class Komponent:
    def metoda(self):
        print('robi coś ciekawego')


class Dekorator(Komponent):
    def metoda(self):
        print('wstęp do ciekawych rzeczy')
        super().metoda()
        print('koniec ciekawych rzeczy')

if __name__ == '__main__':
    komponent = Komponent()
    dekorator = Dekorator()
    komponent.metoda()
    print('wink wink')
    dekorator.metoda()
