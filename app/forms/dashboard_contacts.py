from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import StringField, SelectField, validators


class ContactsForm(FlaskForm):
    departament = StringField('Отдел')
    boss = StringField('Начальник')
    displaying_boss = SelectField('Отображение начальника', coerce=int, validators=[validators.optional()],
                                  choices=[(0, "Не отображается"), (1, "Отображается")], render_kw={'class': 'form-control'})
    phone = StringField('Телефон')
    displaying_phone = SelectField('Отображение телефона', coerce=int, validators=[validators.optional()],
                                   choices=[(0, "Не отображается"), (1, "Отображается")], render_kw={'class': 'form-control'})
    fax = StringField('Факс')
    displaying_fax = SelectField('Отображение факса', coerce=int, validators=[validators.optional()],
                                 choices=[(0, "Не отображается"), (1, "Отображается")], render_kw={'class': 'form-control'})
    email = StringField('Email')
    displaying_email = SelectField('Отображение email', coerce=int, validators=[validators.optional()],
                                   choices=[(0, "Не отображается"), (1, "Отображается")], render_kw={'class': 'form-control'})