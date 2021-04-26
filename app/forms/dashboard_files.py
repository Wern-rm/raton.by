from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import StringField, IntegerField


class FilesForm(FlaskForm):
    name = StringField('Название')
    file = FileField('Документ', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})