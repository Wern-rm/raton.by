from app import db
from datetime import datetime


class Clients(db.Model):
    __tablename__ = 'core_clients'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, unique=True, nullable=False)
    name = db.Column(db.VARCHAR(255), nullable=False, unique=True)
    url = db.Column(db.VARCHAR(255), nullable=False)
    category = db.Column(db.Integer, nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, name, url, category, status=0, create_date=datetime.now()):
        self.name = name
        self.url = url
        self.category = category
        self.status = status
        self.create_date = create_date