from flask_wtf import FlaskForm
from flask_wtf.file import FileField
from wtforms import StringField, TextAreaField


class Form1ElectronAppeal(FlaskForm):
    fio = StringField('Ф.И.О')
    address = StringField('Адрес')
    email = StringField('Адрес')
    message = TextAreaField('Сообщение')
    file = FileField('Прикрепить файл', render_kw={'class': 'form-control'})


class Form2ElectronAppeal(FlaskForm):
    name = StringField('Название')
    address = StringField('Адрес')
    fio = StringField('Ф.И.О')
    email = StringField('Адрес')
    message = TextAreaField('Сообщение')
    file = FileField('Прикрепить файл', render_kw={'class': 'form-control'})