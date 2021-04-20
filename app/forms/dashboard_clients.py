from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import StringField, SelectField, validators


class ClientsForm(FlaskForm):
    name = StringField('Наименование организации')
    category = SelectField('Категория',
                           coerce=int,
                           validators=[validators.optional()],
                           choices=[(1, "Внешний рынок"), (2, "Внутренний рынок")],
                           render_kw={'class': 'form-control'})
    file = FileField('Логотип организации', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})


class ClientsEditForm(FlaskForm):
    name = StringField('Наименование организации')
    category = SelectField('Категория',
                           coerce=int,
                           validators=[validators.optional()],
                           choices=[(1, "Внешний рынок"), (2, "Внутренний рынок")],
                           render_kw={'class': 'form-control'})


class ClientsEditPhotoForm(FlaskForm):
    file = FileField('Изображение руководителя', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})