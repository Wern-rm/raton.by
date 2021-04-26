from app import db
from datetime import datetime


class Shops(db.Model):
    __tablename__ = 'core_shops'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, unique=True, nullable=False)
    name = db.Column(db.VARCHAR(255), nullable=False)
    type = db.Column(db.Integer, nullable=False)
    address = db.Column(db.VARCHAR(255), nullable=False)
    phone = db.Column(db.VARCHAR(255), nullable=True)
    site = db.Column(db.VARCHAR(255), nullable=True)
    email = db.Column(db.VARCHAR(255), nullable=True)
    status = db.Column(db.Integer, nullable=False)
    create_date = db.Column(db.DateTime(), nullable=False)
    displaying_email = db.Column(db.Integer, nullable=False)
    displaying_site = db.Column(db.Integer, nullable=False)

    def __init__(self, name, type, address, phone=None, site=None, email=None, status=0, create_date=datetime.now(),
                 displaying_email=0, displaying_site=0):
        self.name = name
        self.type = type
        self.address = address
        self.phone = phone
        self.site = site
        self.email = email
        self.status = status
        self.create_date = create_date
        self.displaying_email = displaying_email
        self.displaying_site = displaying_site