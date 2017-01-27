import os
import logging
from tornado.web import Application

from paas_utils.internal import get_app_args

from handlers import MainHandler, StatusPageHandler, WorkersHandler, JobsHandler
from workers import BruteForceWorker, DictWorker
from db import DbApi


class ShadowKiller(Application):
    def __init__(self):
        args = get_app_args()
        if 'brute_force' in args:
            self.bf_worker = BruteForceWorker()
        if 'dictionary' in args:
            self.dict_worker = DictWorker()

        if 'main' in args:
            handlers = [
                (r"/", MainHandler),
                (r"/main.html", MainHandler),
                (r"/workers.html", WorkersHandler),
                (r"/jobs.html", JobsHandler)
            ]
        else:
            handlers = [(r"/", StatusPageHandler)]
        logging.info("Hello its me ShadowKiller, my args are: %s" % args)
        super().__init__(
            handlers,
            template_path=os.path.join(os.path.dirname(__file__), 'templates'),
            static_path=os.path.join(os.path.dirname(__file__), 'static')
        )


APPLICATION = ShadowKiller()
