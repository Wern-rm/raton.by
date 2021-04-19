from wtforms import StringField, SelectField, BooleanField, validators, IntegerField, PasswordField
from wtforms.validators import DataRequired, Length, EqualTo
from flask_wtf import FlaskForm


class EmailEditForm(FlaskForm):
    email = StringField('String', validators=[
        DataRequired(message='Обязательное поле.')
    ])


class UsernameEditForm(FlaskForm):
    username = StringField('String', validators=[
        DataRequired(message='Обязательное поле.')
    ])


class StatusForm(FlaskForm):
    status = SelectField('Статус',
                         coerce=int,
                         validators=[validators.optional()])


class PasswordForm(FlaskForm):
    password = StringField('Password', validators=[
        DataRequired(message='Обязательное поле.'),
        Length(min=6, max=16, message='Пароль должен быть не менее 6 и не более 16 символов'),
        EqualTo('confirm', message='Пароли должны совпадать')
    ])
    confirm = PasswordField('Confirm', validators=[
        DataRequired(message='Обязательное поле.')
    ])