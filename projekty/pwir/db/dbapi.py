import random
import datetime
import logging
import socket
from hashlib import md5

from tornado.gen import coroutine
import momoko
from tornado_psql_helper_tools import DbPool


NICKNAMES = [
    'Millennium Falcon', 'Moldy Crow', 'Naboo Royal Cruiser', 'Naboo Royal Starship', 'Naboo Star Skiff',
    'Nebulon-B Frigate', 'Azure Angel II', 'Corellian Corvette', 'Death Star', 'Ebon Hawk', 'Geonosian SolarSailer',
    'The Ghost'
]


class DbApi():

    def __init__(self):
        self.db = DbPool(pool_size=3, manual_cfg={'user': 'shadow_killer_user', 'dbname': 'shadow_killer', 'hosts': [{'port': 5432, 'host': '10.177.51.122'}], 'password': 'bad_password1'})
        self.db.init()
        logging.info('Db init complete')

    def split_hstore(self, hstore):
        letters = hstore.split(', ')
        slownik = dict()
        for letter in letters:
            split_rocket = letter.split('=>')
            split_rocket[0] = split_rocket[0].replace('"', '')
            split_rocket[1] = split_rocket[1].replace('"', '')
            slownik[split_rocket[0]] = False if split_rocket[1] == 'false' else True
        return slownik

    @coroutine
    def update_result(self, job_id, word):
        yield momoko.Op(
            self.db().execute,
            "update available_jobs set status = 'done', result = %s where id = %s",
            parameters=(word, job_id,)
        )

    @coroutine
    def save_request(self, owner, email, shadow):
        yield momoko.Op(
            self.db().execute,
            "insert into audit_log (owner, email, shadow, ts) values (%s, %s, %s, now())",
            parameters=(owner, email, shadow),
        )

    @coroutine
    def save_shadow_entry(self, entry):
        yield momoko.Op(
            self.db().execute,
            "insert into available_jobs values (default, %s, %s, %s, %s, 'registred', false, null, now(), 'registred', null, default)",
            parameters=entry,
        )

    @coroutine
    def register_worker(self, cluster_type):
        host_id = socket.getfqdn()
        worker_id_string = ('{}{}{}'.format(cluster_type, host_id, datetime.datetime.now())).encode('utf-8')
        worker_id = md5(worker_id_string).hexdigest()
        worker_nickname = random.choice(NICKNAMES)
        yield momoko.Op(
            self.db().execute,
            "insert into registred_workers values (%s, %s, %s, %s, now())",
            parameters=(worker_id, worker_nickname, host_id, cluster_type)
        )
        return worker_id

    @coroutine
    def sign_worker(self, worker_id):
        yield momoko.Op(
            self.db().execute,
            "update registred_workers set time_alive = NOW() where id = %s",
            parameters=(worker_id,)
        )

    @coroutine
    def clear_old_workers(self):
        yield momoko.Op(
            self.db().execute,
            "delete from registred_workers where now() - interval '60 second' > time_alive"
        )

    @coroutine
    def get_job(self):
        cursor = yield momoko.Op(
            self.db().execute,
            "select id, hash, salt, algorithm, checked_letters from available_jobs where status != 'done' order by id limit 1;"
        )
        entry = cursor.fetchall()
        return entry

    @coroutine
    def job_done(self, job_id):
        cursor = yield momoko.Op(
            self.db().execute,
            "select status from available_jobs where id = %s",
            parameters=(job_id,)
        )
        return cursor.fetchone()[0] == "done"


    @coroutine
    def lock_letter(self, job_id, letter):
        logging.info('marking letter %s in job %s', letter, job_id)
        yield momoko.Op(
            self.db().execute,
            "update available_jobs SET checked_letters = checked_letters || %s::hstore  where id = %s",
            parameters=("\"%s\" => \"true\"" % letter, job_id,)
        )

    @coroutine
    def get_words_starting_with(self, letter):
        logging.info('getting words starting with %s', letter)
        cursor = yield momoko.Op(
            self.db().execute,
            "select word from dictionary where word_index = %s",
            parameters=(letter,)
        )
        words = cursor.fetchall()
        return [x[0] for x in words]

    @coroutine
    def get_registred_workers(self):
        cursor = yield momoko.Op(
            self.db().execute,
            "select * from registred_workers"
        )
        workery = cursor.fetchall()
        return workery

    @coroutine
    def get_registred_jobs(self):
        cursor = yield momoko.Op(
            self.db().execute,
            """select username, hash, status, result, nickname, worker_id, last_update
               from available_jobs a
               left join registred_workers r on a.worker_id = r.id
               order by last_update
            """
        )
        jobs = cursor.fetchall()
        return jobs
