from tornado.web import RequestHandler
from tornado.gen import coroutine


class StatusPageHandler(RequestHandler):
    @coroutine
    def get(self):
        self.write("""
                      <h1> Hello, its me ShadowKiller </h1>
                      <p> I am one of nodes who is going to work for you </p>
                   """)
