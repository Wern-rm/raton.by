from app import db
from datetime import datetime


class ItemsCategory(db.Model):
    __tablename__ = 'core_items_category'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    title = db.Column(db.VARCHAR(255), nullable=False)
    image = db.Column(db.VARCHAR(255), nullable=True)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)
    is_popular = db.Column(db.Integer, nullable=False)

    def __init__(self, title, image=None, status=0, create_date=datetime.now(), is_popular=0):
        self.title = title
        self.image = image
        self.status = status
        self.create_date = create_date
        self.is_popular = is_popular