from app import db
from datetime import datetime


class Items(db.Model):
    __tablename__ = 'core_items'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    title = db.Column(db.VARCHAR(255), nullable=False)
    text = db.Column(db.Text, nullable=False)
    category_id = db.Column(db.Integer, nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, title, text, category_id, status=0, create_date=datetime.now()):
        self.title = title
        self.text = text
        self.category_id = category_id
        self.status = status
        self.create_date = create_date