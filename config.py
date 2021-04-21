import os
from datetime import timedelta

basedir = os.path.abspath(os.path.dirname(__file__))


class Config(object):

    TEST = False
    DEBUG = False
    SECRET_KEY = str(os.urandom(48))[2:-1].replace('\\x', '')
    USE_SESSION_FOR_NEXT = True

    # Flask LoginManager
    REMEMBER_COOKIE_DURATION = timedelta(days=1)  # Длительность сессии

    REMEMBER_COOKIE_HTTPONLY = True
    REMEMBER_COOKIE_PATH = '/'
    SESSION_REFRESH_EACH_REQUEST = True

    # Flask SQLAlchemy
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@127.0.0.1:3309/raton.by?charset=utf8mb4'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ECHO = False

    # Flask Uploads
    MAX_CONTENT_LENGTH = 30 * 1024 * 1024
    UPLOADS_BASE_DIR = os.getcwd()

    PER_PAGE = 25
    CSS_FRAMEWORK = 'bootstrap4'
    LINK_SIZE = 'sm'
    SHOW_SINGLE_PAGE = True
    UNIT_PAY_ID = '72f7a10ae5762f18598b6ac228314ab3'
    QUERY_IP_BLOCK_COUNT = 10


    APP_FOLDER = os.path.join(UPLOADS_BASE_DIR, 'app')
    STATIC_APP = os.path.join(APP_FOLDER, 'static')