import logging
import time

from tornado.web import RequestHandler
from tornado.gen import coroutine

from db import DbApi
from utils import parse_shadow


class MainHandler(RequestHandler):

    def initialize(self):
        self.dbapi = DbApi()
        self.last_update = time.time()

    @coroutine
    def get(self):
        self.render('main.html')

    @coroutine
    def post(self):
        proj_name = self.get_argument('name')
        email = self.get_argument('mail')
        shadow = self.get_argument('message')
        parsed_shadow = parse_shadow(shadow)
        yield self.dbapi.save_request(proj_name, email, shadow)
        for entry in parsed_shadow:
            yield self.dbapi.save_shadow_entry(entry)
        logging.info('%s, %s, %s', proj_name, email, shadow)


class WorkersHandler(RequestHandler):

    def initialize(self):
        self.dbapi = DbApi()

    @coroutine
    def get(self):
        yield self.dbapi.clear_old_workers()
        workers = yield self.dbapi.get_registred_workers()
        self.render('workers.html', workers=workers, i=1)


class JobsHandler(RequestHandler):

    def initialize(self):
        self.dbapi = DbApi()

    @coroutine
    def get(self):
        jobs = yield self.dbapi.get_registred_jobs()
        logging.info(jobs)
        self.render('jobs.html', jobs=jobs, i=1)
