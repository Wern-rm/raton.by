from app import db
from datetime import datetime


class ItemImages(db.Model):
    __tablename__ = 'core_item_images'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    item_id = db.Column(db.Integer, nullable=False)
    url = db.Column(db.Text, nullable=False)
    general = db.Column(db.Integer, nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, item_id, url, general=0, status=0, create_date=datetime.now()):
        self.item_id = item_id
        self.url = url
        self.general = general
        self.status = status
        self.create_date = create_date