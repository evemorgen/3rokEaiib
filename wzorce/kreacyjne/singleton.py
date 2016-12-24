class Singleton(object):
    instance = None

    def __new__(cls, *args, **kwargs):
        if cls.instance is None:
            super(Singleton, cls).__new__(cls, *args, **kwargs)
        return cls.instance


class Dupa(Singleton):
    pass


if __name__ == '__main__':
    dupa1 = Dupa()
    dupa2 = Dupa()
    print('%s == %s' % (id(dupa1), id(dupa2)))
    print(dupa1 == dupa2)
