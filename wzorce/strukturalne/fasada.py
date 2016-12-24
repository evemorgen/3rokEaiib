class Klasa:
    def start(self):
        print('start')

    def stop(self):
        print('stop')

    def operacja1(self):
        print('1')

    def operacja2(self):
        print('2')


class FasadaKlasy:
    def __init__(self, objekt_klasy):
        self.objekt = objekt_klasy

    def wykonaj(self):
        print('!!fasadowana!!')
        self.objekt.start()
        self.objekt.operacja1()
        self.objekt.operacja2()
        self.objekt.stop()

if __name__ == '__main__':
    objekt_klasy_fasadowanej = Klasa()
    objekt_fasady = FasadaKlasy(objekt_klasy_fasadowanej)

    objekt_klasy_fasadowanej.start()
    objekt_klasy_fasadowanej.operacja1()
    objekt_klasy_fasadowanej.operacja2()
    objekt_klasy_fasadowanej.stop()

    objekt_fasady.wykonaj()
