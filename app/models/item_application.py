from app import db
from datetime import datetime


class ItemApplications(db.Model):
    __tablename__ = 'core_item_applications'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    item_id = db.Column(db.Integer, nullable=False)
    name = db.Column(db.VARCHAR(255), nullable=False)
    phone = db.Column(db.VARCHAR(255), nullable=False)
    email = db.Column(db.VARCHAR(255), nullable=False)
    comment = db.Column(db.Text, nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, item_id, name, phone, email, comment, status=0, create_date=datetime.now()):
        self.item_id = item_id
        self.name = name
        self.phone = phone
        self.email = email
        self.comment = comment
        self.status = status
        self.create_date = create_date