from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import StringField


class ReviewsForm(FlaskForm):
    name = StringField('Наименование организации')
    file = FileField('Логотип организации', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})