from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField


class PhoneQuestionForm(FlaskForm):
    name = StringField('Ф.И.О')
    phone = StringField('Адрес')