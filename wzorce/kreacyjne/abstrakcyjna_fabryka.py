class AbstrakcyjnaFabryka:
    def __init__(self, fabryka):
        self.fabryka = fabryka

    def stworz(self):
        return self.fabryka.stworz()


class FabrykaA:
    def stworz(self):
        return A()


class FabrykaB:
    def stworz(self):
        return B()


class A:
    pass


class B:
    pass


if __name__ == '__main__':
    fabrykaA = AbstrakcyjnaFabryka(FabrykaA())
    objA = fabrykaA.stworz()
    print(objA)

    fabrykaB = AbstrakcyjnaFabryka(FabrykaB())
    objB = fabrykaB.stworz()
    print(objB)
