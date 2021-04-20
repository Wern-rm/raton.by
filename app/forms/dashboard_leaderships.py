from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import SubmitField, StringField


class LeadershipsForm(FlaskForm):
    post = StringField('Должность')
    username = StringField('Ф.И.О.')
    phone = StringField('Телефон')
    fax = StringField('Факс')
    email = StringField('Электронная почта')
    file = FileField('Изображение руководителя', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})


class LeadershipsEditForm(FlaskForm):
    post = StringField('Должность')
    username = StringField('Ф.И.О.')
    phone = StringField('Телефон')
    fax = StringField('Факс')
    email = StringField('Электронная почта')


class LeadershipsEditPhotoForm(FlaskForm):
    file = FileField('Изображение руководителя', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})