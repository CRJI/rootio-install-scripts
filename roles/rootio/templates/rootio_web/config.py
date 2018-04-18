import os
from utils import make_dir

PROJECT_ROOT = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
INSTANCE_FOLDER_PATH = os.path.join(PROJECT_ROOT, 'instance')

class BaseConfig(object):
    PROJECT = "rootio"
    SECRET_KEY = 'some random key'
    CONTENT_DIR = "/opt/rootio/content"
    LOG_FOLDER = os.path.join(INSTANCE_FOLDER_PATH, 'log')
    make_dir(LOG_FOLDER)
    ZMQ_BIND_ADDR = "tcp://127.0.0.1:55777"
    ZMQ_SOCKET_TYPE = "PUB"
    ACCEPT_LANGUAGES = {'en':'English'}
    SCHEDULE_EVENTS_SERVER_IP = '127.0.0.1'
    SCHEDULE_EVENTS_SERVER_PORT = 12345
    SQLALCHEMY_DATABASE_URI = 'postgres:///rootio'

class DefaultConfig(BaseConfig):
    pass
