from flask_wtf import FlaskForm
from wtforms.validators import DataRequired
from flask_ckeditor import CKEditorField
from wtforms import StringField, SelectField, validators


class ItemsForm(FlaskForm):
    title = StringField('Отдел')
    text = CKEditorField('Текст страницы', validators=[DataRequired()])
    category_id = SelectField('Категория',
                                  coerce=int,
                                  validators=[validators.optional()],
                                  render_kw={'class': 'form-control'})



class ItemsCategoryForm(FlaskForm):
    title = StringField('Название', render_kw={'class': 'form-control'})