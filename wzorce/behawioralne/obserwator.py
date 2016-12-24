class Oberwator:
    def __init__(self):
        self.obserwowani = []

    def register(self, obserwowany):
        self.obserwowani.append(obserwowany)

    def unregister(self, obserwowany):
        self.obserwowani.remove(obserwowany)

    def notify(self, message):
        print('idzie notify\n%s' % ('-'*10))
        for objekt in self.obserwowani:
            objekt.notify(message)


class Obserwowany1:
    def notify(self, message):
        print('Obserwowany1 id: %s - notified: %s' % (id(self), message))


class Obserwowany2:
    def notify(self, message):
        print('Obserwowany2 tutaj wstaw jakiegoś krzaka: %s' % message)

if __name__ == '__main__':
    obserwartor = Oberwator()
    ob1 = Obserwowany1()
    ob2 = Obserwowany2()
    ob3 = Obserwowany1()

    obserwartor.register(ob1)
    obserwartor.register(ob2)
    obserwartor.register(ob3)

    obserwartor.notify('olaboga')

    obserwartor.unregister(ob3)

    obserwartor.notify('olaboga')
