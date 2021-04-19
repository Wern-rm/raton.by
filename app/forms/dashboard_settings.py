from flask_wtf import FlaskForm
from wtforms import StringField, SelectField, validators


class SettingsForm1(FlaskForm):
    setting_1 = StringField('setting_1')
    setting_2 = SelectField('setting_2',
                            coerce=str,
                            validators=[validators.optional()])
    setting_3 = SelectField('setting_3',
                            coerce=str,
                            validators=[validators.optional()])
    setting_4 = SelectField('setting_4',
                            coerce=str,
                            validators=[validators.optional()])


class SettingsForm2(FlaskForm):
    setting_1 = SelectField('setting_1',
                            coerce=str,
                            validators=[validators.optional()])
    setting_2 = StringField('setting_2')
    setting_3 = StringField('setting_3')
    setting_4 = StringField('setting_4')
    setting_5 = SelectField('setting_5',
                            coerce=str,
                            validators=[validators.optional()])
    setting_6 = StringField('setting_6')
    setting_7 = StringField('setting_7')
    setting_8 = SelectField('setting_8',
                            coerce=str,
                            validators=[validators.optional()])
