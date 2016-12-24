class Kontekst:
    def __init__(self, stan_poczatkowy):
        self.stan = stan_poczatkowy

    def set_state(self, stan):
        self.stan = stan

    def get_current_state(self):
        return str(self.stan)

    def next_state(self):
        self.stan = self.stan.next()


class State:
    def next(self):
        assert 0, "pls override this method"


class StateOne(State):
    def __str__(self):
        return 'jeden'

    def next(self):
        return StateTwo()


class StateTwo(State):
    def __str__(self):
        return 'dwa'

    def next(self):
        return StateOne()


if __name__ == '__main__':
    kon = Kontekst(StateOne())
    print(kon.get_current_state())
    kon.next_state()
    print(kon.get_current_state())
    kon.next_state()
    print(kon.get_current_state())
    kon.set_state(StateTwo)
