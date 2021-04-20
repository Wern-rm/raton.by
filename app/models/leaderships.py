from app import db
from datetime import datetime


class Leaderships(db.Model):
    __tablename__ = 'core_leaderships'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False, unique=True)
    post = db.Column(db.VARCHAR(255), nullable=False)
    username = db.Column(db.VARCHAR(255), nullable=False)
    url = db.Column(db.VARCHAR(255), nullable=False)
    phone = db.Column(db.VARCHAR(255), nullable=False)
    fax = db.Column(db.VARCHAR(255), nullable=False)
    email = db.Column(db.VARCHAR(255), nullable=False)
    status = db.Column(db.Integer(), nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, post, username, url, phone, fax, email, status=0, create_date=datetime.now()):
        self.post = post
        self.username = username
        self.url = url
        self.phone = phone
        self.fax = fax
        self.email = email
        self.status = status
        self.create_date = create_date