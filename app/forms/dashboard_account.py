from wtforms import StringField, SelectField, BooleanField, validators, IntegerField, PasswordField
from wtforms.validators import DataRequired, Length, EqualTo
from flask_wtf import FlaskForm


class UserEditForm(FlaskForm):
    email = StringField('String', validators=[
        DataRequired(message='Обязательное поле.')
    ])
    username = StringField('String', validators=[
        DataRequired(message='Обязательное поле.')
    ])


class PasswordForm(FlaskForm):
    password = StringField('Password', validators=[
        DataRequired(message='Обязательное поле.'),
        Length(min=6, max=16, message='Пароль должен быть не менее 6 и не более 16 символов'),
        EqualTo('confirm_password', message='Пароли должны совпадать')
    ])
    confirm_password = PasswordField('Confirm', validators=[
        DataRequired(message='Обязательное поле.')
    ])