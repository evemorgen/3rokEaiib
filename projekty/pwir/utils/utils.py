import logging

hash_algorithms = {
    '1': 'md5',
    '2': 'Blowfish',
    '3': 'eksblowfish',
    '5': 'sha256',
    '6': 'sha512'
}


def parse_shadow(shadow):
    entries = []
    lines = shadow.splitlines()
    for line in lines:
        if line != '':
            splitted = line.split(':')
            user = splitted[0]
            password = splitted[1]
            if password != '!!' and password != '*':
                _, algo, salt, passwd = password.split('$')
                logging.info('found real-user: %s - algorithm:  %s, salt: %s, passwd: %s', user, hash_algorithms[algo], salt, passwd)
                entry = tuple([user, passwd, salt, hash_algorithms[algo]])
                entries.append(entry)
    return entries
