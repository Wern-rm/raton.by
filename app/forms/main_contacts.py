from flask_wtf import FlaskForm
from wtforms import *
from wtforms.validators import DataRequired, Length, Email


class CreateMessageForm(FlaskForm):
    """Форма добавления обратной связи"""
    name = StringField('Ваше имя', validators=[
        DataRequired(message='Обязательное поле'),
        Length(min=2, max=15, message='Имя должно состоять не менее чем из 2 и не более 15 символов.')
    ])
    email = StringField('Ваш email', validators=[
        Email(message='Обязательное поле'),
        Length(min=6, max=30, message='Email должен быть не менее 2 и не более 30 символов.')
    ])
    phone = StringField('Ваш номер телефона', validators=[
        DataRequired(message='Обязательное поле'),
        Length(min=12, max=13, message='Номер телефона должнен состоять не менее чем из 12 и не более 13 символов.')
    ])
    text = TextAreaField('Ваш вопрос', validators=[
        DataRequired(message='Обязательное поле'),
        Length(min=1, max=1000, message='Вопрос должен состоять не более чем из 1000 символов.')
    ])