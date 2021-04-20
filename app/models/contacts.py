from app import db
from datetime import datetime


class Contacts(db.Model):
    __tablename__ = 'core_contacts'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, unique=True, nullable=False)
    departament = db.Column(db.VARCHAR(255), nullable=False, unique=True)
    boss = db.Column(db.VARCHAR(255), nullable=False)
    phone = db.Column(db.VARCHAR(255), nullable=False)
    fax = db.Column(db.VARCHAR(255), nullable=False)
    email = db.Column(db.VARCHAR(255), nullable=False)
    displaying_boss = db.Column(db.Integer, nullable=False)
    displaying_phone = db.Column(db.Integer, nullable=False)
    displaying_fax = db.Column(db.Integer, nullable=False)
    displaying_email = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)

    def __init__(self, departament, boss, phone, fax, email, displaying_boss, displaying_phone,
                 displaying_fax, displaying_email, create_date=datetime.now()):
        self.departament = departament
        self.boss = boss
        self.phone = phone
        self.fax = fax
        self.email = email
        self.displaying_boss = displaying_boss
        self.displaying_phone = displaying_phone
        self.displaying_fax = displaying_fax
        self.displaying_email = displaying_email
        self.create_date = create_date