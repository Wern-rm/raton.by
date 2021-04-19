from app import db


class Settings(db.Model):
    __tablename__ = 'core_settings'

    id = db.Column(db.Integer, primary_key=True, autoincrement=True, unique=True, nullable=False)
    key = db.Column(db.VARCHAR(255), nullable=False, unique=True)
    value = db.Column(db.TEXT, nullable=False)
    type = db.Column(db.VARCHAR(10), nullable=False)

    def __init__(self, key, value, type):
        self.key = key
        self.value = value
        self.type = type