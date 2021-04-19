from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, Email
from flask_wtf import FlaskForm


class LoginForm(FlaskForm):
    login = StringField('Логин', validators=[
        Email(message='Обязательное поле'),
        Length(min=3, max=80, message='Email должен быть не менее 3 и не более 80 символов')
    ])
    password = PasswordField('Пароль', validators=[
        DataRequired(message='Обязательное поле'),
        Length(min=8, max=24, message='Пароль должен быть не менее 8 и не более 24 символов.')
    ])
    submit = SubmitField("Войти")
