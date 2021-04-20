from app import db
from datetime import datetime


class Questions(db.Model):
    __tablename__ = 'core_questions'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    username = db.Column(db.VARCHAR(255), nullable=False)
    email = db.Column(db.VARCHAR(255), nullable=False)
    phone = db.Column(db.VARCHAR(255), nullable=False)
    message = db.Column(db.TEXT, nullable=False)
    status = db.Column(db.Integer(), nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, username, email, phone, message, status=0, create_date=datetime.now()):
        self.username = username
        self.email = email
        self.phone = phone
        self.message = message
        self.status = status
        self.create_date = create_date