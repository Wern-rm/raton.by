from app import db
from datetime import datetime


class ItemFiles(db.Model):
    __tablename__ = 'core_item_files'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    name = db.Column(db.VARCHAR(255), nullable=False)
    item_id = db.Column(db.Integer, nullable=False)
    url = db.Column(db.Text, nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, name, item_id, url, status=0, create_date=datetime.now()):
        self.name = name
        self.item_id = item_id
        self.url = url
        self.status = status
        self.create_date = create_date