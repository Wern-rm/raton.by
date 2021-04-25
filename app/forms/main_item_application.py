from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField


class ItemApplicationForm(FlaskForm):
    name = StringField('Ф.И.О')
    phone = StringField('Адрес')
    email = StringField('Адрес')
    message = TextAreaField('Сообщение')