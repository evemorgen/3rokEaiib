class KlasaKlienta:
    def metoda_klienta(self, lista):
        pass


class KlasaAdaptowana:
    def instniejaca_metoda(self, string):
        print('ta metoda robi coś super %s' % string)


class Adapter(KlasaKlienta):
    def __init__(self):
        self.adaptowana = KlasaAdaptowana()

    def metoda_klienta(self, lista):
        dostosowane = '1.%s, 2.%s' % tuple(lista)
        self.adaptowana.instniejaca_metoda(dostosowane)

if __name__ == '__main__':
    adapter = Adapter()
    adapter.metoda_klienta(['lista', 'czegos'])
