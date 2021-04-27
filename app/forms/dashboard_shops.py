from flask_wtf import FlaskForm
from wtforms import StringField, SelectField, validators


class ShopsForm(FlaskForm):
    name = StringField('Наименование организации')
    address = StringField('Наименование организации')
    phone = StringField('Наименование организации')
    email = StringField('Наименование организации')
    site = StringField('Наименование организации')
    type = SelectField('Категория',
                           coerce=int,
                           validators=[validators.optional()],
                           choices=[(1, "ТНП"), (2, "ЭЛЕКТРОТЕХНИКА")],
                           render_kw={'class': 'form-control'})


class ShopsMapForm(FlaskForm):
    tnp = StringField('Карта ТНП')
    electro = StringField('Карта Электротех')