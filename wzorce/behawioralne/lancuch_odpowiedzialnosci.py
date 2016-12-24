class Context:
    def __init__(self):
        self.strategy = []

    def add_strategy(self, strategy):
        self.strategy.append(strategy)

    def get_strategy(self):
        return self.strategy

    def execute(self, argsy):
        for algo in self.strategy:
            ret = algo.execute(argsy)
            if ret is True:
                return 'Done'
        else:
            return 'dupa'


class Strategia:
    def __init__(self, strategia):
        self.execute = strategia


def strategia1(lista):
    if isinstance(lista, list):
        # tu przetwarzamy
        return True
    return False


def strategia2(tupla):
    if isinstance(tupla, tuple):
        # tu przetwarzamy
        return True
    return False

if __name__ == '__main__':
    str1 = Strategia(strategia1)
    str2 = Strategia(strategia2)
    con = Context()
    con.add_strategy(str1)
    con.add_strategy(str2)
    lista = [1, 2, 3]
    print(con.execute(lista))
    tupla = (1, 2, 3)
    print(con.execute(tupla))
    slownik = {'a': 'b'}
    print(con.execute(slownik))
