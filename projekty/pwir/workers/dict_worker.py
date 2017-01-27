import logging
import time
import random
import sys
import crypt
from tornado.gen import coroutine
from tornado_yieldperiodic.yieldperiodic import YieldPeriodicCallback

from db import DbApi

hash_algorithms = {
    'md5': '1',
    'Blowfish': '2',
    'eksblowfish': '3',
    'sha256': '5',
    'sha512': '6'
}


class DictWorker(YieldPeriodicCallback):
    def __init__(self):
        self.db = DbApi()
        self.run_no = 0
        self.working = False
        self.last_register = time.time()
        self.pending_futures = []
        YieldPeriodicCallback.__init__(self, self.run, 500, faststart=True)
        logging.info('DickWorker initialized')

    @coroutine
    def compare_hash(self, word):
        return (self.salt_string + self.pass_hash == crypt.crypt(word, self.salt_string), word)

    @coroutine
    def run(self):
        if self.run_no == 0:
            self.worker_id = yield self.db.register_worker('D')
            logging.info('D worker registred')
        if time.time() - self.last_register > 15:
            yield self.db.sign_worker(self.worker_id)
            done = yield self.db.job_done(self.job_id)
            if done is True or len(self.words_to_process) == 0:
                self.working = False
            self.last_register = time.time()
            logging.info('renewed subscription')
            logging.info('words to go: %s' % (len(self.words_to_process)))
        if self.working is False:
            job = yield self.db.get_job()
            self.job_id = job[0][0]
            self.pass_hash = job[0][1]
            salt = job[0][2]
            algorithm = job[0][3]
            self.salt_string = "$%s$%s$" % (hash_algorithms[algorithm], salt)
            letters = self.db.split_hstore(job[0][4])
            self.letter = random.choice([x for x in letters if letters[x] is False])
            yield self.db.lock_letter(self.job_id, self.letter)
            self.words_to_process = yield self.db.get_words_starting_with(self.letter)
            logging.info("I have %s words to process" % len(self.words_to_process))
            self.working = True
        if self.working is True:
            logging.info("number of pending futures: %s" % len(self.pending_futures))
            for futurka in self.pending_futures:
                if futurka.done() is True:
                    self.pending_futures.remove(futurka)
                    a = futurka.result()
                    logging.info(a)
                    if a[0] is True:
                        yield self.db.update_result(self.job_id, a[1])
                        logging.info("HOLY SMOKE, THE PASSWORD IS %s" % a[1])
                        sys.exit(1)
            i = 5 if len(self.words_to_process) >= 5 else len(self.words_to_process)
            for i in range(i):
                futurka = self.compare_hash(self.words_to_process.pop(0))
                self.pending_futures.append(futurka)

        self.run_no += 1
