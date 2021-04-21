from flask_wtf import FlaskForm
from wtforms.validators import DataRequired
from flask_ckeditor import CKEditorField
from wtforms import StringField, SelectField, validators
from flask_wtf.file import FileField, FileRequired


class NewsForm(FlaskForm):
    title = StringField('Заголовок')
    category = SelectField('Категория',
                            coerce=int,
                            validators=[validators.optional()], render_kw={'class': 'form-control'})
    text = CKEditorField('Тест страницы', validators=[DataRequired()])
    file = FileField('Изображение новости', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})


class NewsCategoryForm(FlaskForm):
    name = StringField('Название')


class NewsEditForm(FlaskForm):
    title = StringField('Заголовок')
    category = SelectField('Категория',
                            coerce=int,
                            validators=[validators.optional()], render_kw={'class': 'form-control'})
    text = CKEditorField('Тест страницы', validators=[DataRequired()])


class NewsEditImageForm(FlaskForm):
    file = FileField('Изображение новости', validators=[FileRequired(u'File was empty!')], render_kw={'class': 'form-control'})
