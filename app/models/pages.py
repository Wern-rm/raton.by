from app import db
from datetime import datetime


class Pages(db.Model):
    __tablename__ = 'core_pages'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    alias = db.Column(db.VARCHAR(255), nullable=False)
    name = db.Column(db.VARCHAR(255), nullable=False)
    text = db.Column(db.Text, nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, alias, name, text, status=0, create_date=datetime.now()):
        self.alias = alias
        self.name = name
        self.text = text
        self.status = status
        self.create_date = create_date