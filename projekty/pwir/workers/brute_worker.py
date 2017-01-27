import logging
from tornado.gen import coroutine
from db import DbApi
from tornado_yieldperiodic.yieldperiodic import YieldPeriodicCallback


class BruteForceWorker(YieldPeriodicCallback):
    def __init__(self):
        self.db = DbApi()
        self.run_no = 0
        YieldPeriodicCallback.__init__(self, self.run, 1000, faststart=True)
        logging.info("running BF worker")

    @coroutine
    def run(self):
        if self.run_no == 0:
            self.worker_id = yield self.db.register_worker('BF')
            logging.info('BF worker registred')
        if self.run_no % 15 == 0:
            yield self.db.sign_worker(self.worker_id)
            logging.info('renewed subscription')
        self.run_no += 1
