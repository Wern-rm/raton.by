from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import SelectField, StringField


class PhotoCatalogsForm(FlaskForm):
    name = StringField('Название')


class MediaPhotos(FlaskForm):
    file = FileField('Изображение', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})


class MediaVideos(FlaskForm):
    name = StringField('Название')
    url = StringField('URL youtube')