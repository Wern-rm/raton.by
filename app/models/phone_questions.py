from app import db
from datetime import datetime


class PhoneQuestions(db.Model):
    __tablename__ = 'core_phone_questions'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    name = db.Column(db.VARCHAR(255), nullable=False)
    phone = db.Column(db.VARCHAR(255), nullable=False)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, name, phone, status=0, create_date=datetime.now()):
        self.name = name
        self.phone = phone
        self.status = status
        self.create_date = create_date