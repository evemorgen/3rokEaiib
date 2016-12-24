class Wizytator:
    def __str__(self):
        return str(self.__class__.__name__)

    def visit(self, wizytowany):
        assert False, "pls override this method"


class Element:
    def accept(self, wizytator):
        wizytator.visit(self)


class DoWizytacji(Element):
    def dorecz_pozew(self):
        print('doreczono mi pozew :(')

    def dorecz_mandat(self):
        print('doreczono mi mandat :c')


class SmutnyPanWGarniturze(Wizytator):
    def visit(self, wizytowany):
        wizytowany.dorecz_pozew()


class SmutnyPanWNiebieskim(Wizytator):
    def visit(self, wizytowany):
        wizytowany.dorecz_mandat()

if __name__ == '__main__':
    policjant = SmutnyPanWNiebieskim()
    komornik = SmutnyPanWGarniturze()
    wizytowany = DoWizytacji()
    wizytowany.accept(policjant)
    wizytowany.accept(komornik)
