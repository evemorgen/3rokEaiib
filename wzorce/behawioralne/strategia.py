class Context:
    def set_strategy(self, strategy):
        self.strategy = strategy

    def get_strategy(self):
        return self.strategy

    def execute_strategy(self):
        self.strategy.execute()


class Strategia:
    def __init__(self, strategia):
        self.execute = strategia


def strategia1():
    print('SUPER STRATEGIA 1')


if __name__ == '__main__':
    str1 = Strategia(strategia1)
    con = Context()
    con.set_strategy(str1)
    con.execute_strategy()
    print(con.get_strategy())
    print(str1)
