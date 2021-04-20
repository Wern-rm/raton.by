from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired
from wtforms import SubmitField


class SliderForm(FlaskForm):
    file = FileField('Ваше изображение', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})
    submit = SubmitField('Добавить', render_kw={'class': 'btn btn-outline-success'})