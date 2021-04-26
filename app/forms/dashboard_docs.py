from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import StringField, IntegerField


class DocsForm(FlaskForm):
    name = StringField('Название')
    year = IntegerField('Год')
    file = FileField('Документ', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})