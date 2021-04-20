from app import db
from datetime import datetime


class ElectronicAppeals(db.Model):
    __tablename__ = 'core_electronic_appeals'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, nullable=False)
    username = db.Column(db.VARCHAR(255), nullable=False)
    address = db.Column(db.VARCHAR(255), nullable=False)
    email = db.Column(db.VARCHAR(255), nullable=False)
    email_key = db.Column(db.Integer, nullable=False)
    message = db.Column(db.TEXT, nullable=False)
    file = db.Column(db.VARCHAR(255), nullable=True)
    status = db.Column(db.Integer(), nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, username, address, email, email_key, message, file=None, status=0, create_date=datetime.now()):
        self.username = username
        self.address = address
        self.email = email
        self.email_key = email_key
        self.message = message
        self.file = file
        self.status = status
        self.create_date = create_date