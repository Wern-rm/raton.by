from app import db
from datetime import datetime


class News(db.Model):
    __tablename__ = 'core_news'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    title = db.Column(db.VARCHAR(255), nullable=False)
    text = db.Column(db.Text, nullable=False)
    image = db.Column(db.VARCHAR(255), nullable=False)
    category_id = db.Column(db.Integer, nullable=False)
    views = db.Column(db.Integer, nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, title, text, image, category_id, views=0, status=0, create_date=datetime.now()):
        self.title = title
        self.text = text
        self.image = image
        self.category_id = category_id
        self.views = views
        self.status = status
        self.create_date = create_date