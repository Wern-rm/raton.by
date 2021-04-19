# -*- coding: utf-8 -*-
from wtforms import *
from wtforms.validators import DataRequired, Length, Email, Required, EqualTo
from flask_wtf import FlaskForm


class RegistrationsForm(FlaskForm):
    """ Форма регистрации аккаунта """
    username = StringField('Имя', validators=[
        DataRequired(message='Обязательное поле'),
        Length(min=5, max=60, message='ФИО должен быть не менее 5 и не более 60 символов')
    ])
    email = StringField('E-mail', validators=[
        Email(message='Обязательное поле'),
        Length(min=3, max=30, message='Email должен быть не менее 3 и не более 30 символов')
    ])
    password = PasswordField('Пароль', validators=[
        DataRequired(message='Обязательное поле'),
        Length(min=6, max=16, message='Пароль должен быть не менее 6 и не более 16 символов'),
        EqualTo('confirm_password', message='Пароли не совпадают')
    ])
    confirm_password = PasswordField('Повторите пароль')
    check = BooleanField('Ознакомился с правилами системы')