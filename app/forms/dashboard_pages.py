from flask_wtf import FlaskForm
from wtforms.validators import DataRequired
from flask_ckeditor import CKEditorField
from wtforms import StringField


class PagesForm(FlaskForm):
    name = StringField('Название')
    alias = StringField('Алиас')
    text = CKEditorField('Текст страницы', validators=[DataRequired()])
