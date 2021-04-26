from app import db
from datetime import datetime


class Files(db.Model):
    __tablename__ = 'core_files'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    name = db.Column(db.VARCHAR(255), nullable=False)
    url = db.Column(db.VARCHAR(255), nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, name,  url, create_date=datetime.now()):
        self.name = name
        self.url = url
        self.create_date = create_date