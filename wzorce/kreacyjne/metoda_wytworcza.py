class Tworca:
    def factory(self, typ):
        if typ == '1':
            return Pierwsza()
        if typ == '2':
            return Druga()


class Pierwsza:
    def __init__(self):
        print('Hello z pierwszej')

    def cos1(self):
        print('cos z pierwszej')


class Druga:
    def __init__(self):
        print('Hello z drugiej')

    def cos2(self):
        print('cos z drugiej')

if __name__ == '__main__':
    tworzaca = Tworca()
    pierwszy = tworzaca.factory('1')
    drugi = tworzaca.factory('2')
    print('-' * 10)
    pierwszy.cos1()
    drugi.cos2()
