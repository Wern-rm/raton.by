import base64
import hashlib
from datetime import datetime

from flask_login import UserMixin

from app import db, login


@login.user_loader
def load_user(user_id: int):
    return db.session.query(Users).get(user_id)


class Users(UserMixin, db.Model):
    __tablename__ = 'core_accounts'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False, unique=True)
    email = db.Column(db.VARCHAR(30), nullable=False, unique=True)
    password = db.Column(db.VARCHAR(100), nullable=False)
    activated = db.Column(db.Boolean, nullable=False)
    last_ip = db.Column(db.VARCHAR(20), nullable=True)
    session_id = db.Column(db.VARCHAR(100), nullable=True)
    create_date = db.Column(db.DateTime(), nullable=False)
    edit_date = db.Column(db.DateTime(), nullable=False)
    username = db.Column(db.VARCHAR(255), nullable=False)
    is_banned = db.Column(db.Boolean, nullable=False)

    def __init__(self, email, password, username, activated=False, last_ip=None, session_id=None,
                 create_date=datetime.now(), edit_date=datetime.now(), is_banned=False):
        self.email = email
        self.password = self.sha256_base64(password)
        self.username = username
        self.activated = activated
        self.last_ip = last_ip
        self.session_id = session_id
        self.create_date = create_date
        self.edit_date = edit_date
        self.is_banned = is_banned

    @staticmethod
    def is_active(**kwargs):
        return True

    @staticmethod
    def is_authenticated(**kwargs):
        return True

    @staticmethod
    def is_anonymous(**kwargs):
        return False

    def get_id(self):
        try:
            return str(self.id)
        except AttributeError:
            raise NotImplementedError('No `id` attribute - override `get_id`')

    @staticmethod
    def sha256_base64(string):
        return base64.b64encode(hashlib.sha256(string.encode('utf-8')).digest()).decode()