from app import db, logger
from distutils import util
from flask import render_template, request, redirect, url_for, current_app
from flask_login import login_required

from app.controllers.dashboard_controller import dashboard_controller
from app.views.dashboard import bp
from app.models.settings import Settings
from app.forms.dashboard_settings import SettingsForm1, SettingsForm2


@bp.route('/setting', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def settings(**kwargs):
    form1 = SettingsForm1(setting_2=current_app.config.get('PROJECT_STATUS'),
                          setting_3=current_app.config.get('TECHNICAL_WORKS'),
                          setting_4=current_app.config.get('TEMPLATES_AUTO_RELOAD'))
    form1.setting_2.choices = [("False", "Disable"), ("True", "Enable")]
    form1.setting_3.choices = [("False", "Disable"), ("True", "Enable")]
    form1.setting_4.choices = [("False", "Disable"), ("True", "Enable")]
    if form1.validate_on_submit() and request.form['form-id'] == '1':
        try:
            db.session.query(Settings).filter(Settings.key == 'PROJECT_NAME').update({'value': str(form1.setting_1.data)})
            db.session.query(Settings).filter(Settings.key == 'PROJECT_STATUS').update({'value': str(form1.setting_2.data)})
            db.session.query(Settings).filter(Settings.key == 'TECHNICAL_WORKS').update({'value': str(form1.setting_3.data)})
            db.session.query(Settings).filter(Settings.key == 'TEMPLATES_AUTO_RELOAD').update({'value': str(form1.setting_4.data)})
            db.session.commit()
            current_app.config.update(
                PROJECT_NAME=form1.setting_1.data,
                PROJECT_STATUS=bool(util.strtobool(form1.setting_2.data)),
                TECHNICAL_WORKS=bool(util.strtobool(form1.setting_3.data)),
                TEMPLATES_AUTO_RELOAD=bool(util.strtobool(form1.setting_4.data))
            )
            return redirect(url_for('dashboard.settings', action='success', action_id=123))
        except Exception as e:
            logger.error(e)
            db.session.rollback()
            return redirect(url_for('dashboard.settings', action='error', action_id=123))
    form2 = SettingsForm2(setting_1=current_app.config.get('MAIL_ENABLED'),
                          setting_5=current_app.config.get('MAIL_USE_SSL'),
                          setting_8=current_app.config.get('MAIL_USE_TLS'))
    form2.setting_1.choices = [("False", "Disable"), ("True", "Enable")]
    form2.setting_5.choices = [("False", "Disable"), ("True", "Enable")]
    form2.setting_8.choices = [("False", "Disable"), ("True", "Enable")]
    if form2.validate_on_submit() and request.form['form-id'] == '2':
        try:
            db.session.query(Settings).filter(Settings.key == 'MAIL_ENABLED').update({'value': str(form2.setting_1.data)})
            db.session.query(Settings).filter(Settings.key == 'MAIL_TITLE').update({'value': str(form2.setting_2.data)})
            db.session.query(Settings).filter(Settings.key == 'MAIL_SERVER').update({'value': str(form2.setting_3.data)})
            db.session.query(Settings).filter(Settings.key == 'MAIL_PORT').update({'value': str(form2.setting_4.data)})
            db.session.query(Settings).filter(Settings.key == 'MAIL_USE_SSL').update({'value': str(form2.setting_5.data)})
            db.session.query(Settings).filter(Settings.key == 'MAIL_USERNAME').update({'value': str(form2.setting_6.data)})
            db.session.query(Settings).filter(Settings.key == 'MAIL_PASSWORD').update({'value': str(form2.setting_7.data)})
            db.session.query(Settings).filter(Settings.key == 'MAIL_USE_TLS').update({'value': str(form2.setting_8.data)})
            db.session.commit()
            current_app.config.update(
                MAIL_ENABLED=bool(util.strtobool(form2.setting_1.data)),
                MAIL_TITLE=form2.setting_2.data,
                MAIL_SERVER=form2.setting_3.data,
                MAIL_PORT=form2.setting_4.data,
                MAIL_USE_SSL=bool(util.strtobool(form2.setting_5.data)),
                MAIL_USERNAME=form2.setting_6.data,
                MAIL_PASSWORD=form2.setting_7.data,
                MAIL_USE_TLS=bool(util.strtobool(form2.setting_8.data))
            )
            return redirect(url_for('dashboard.settings', action='success', action_id=123))
        except Exception as e:
            logger.error(e)
            db.session.rollback()
            return redirect(url_for('dashboard.settings', action='error', action_id=123))
    kwargs['title'] = 'Управление настройками'
    kwargs['form1'] = form1
    kwargs['form2'] = form2
    kwargs['PROJECT_NAME'] = current_app.config.get('PROJECT_NAME')
    kwargs['MAIL_TITLE'] = current_app.config.get('MAIL_TITLE')
    kwargs['MAIL_SERVER'] = current_app.config.get('MAIL_SERVER')
    kwargs['MAIL_PORT'] = current_app.config.get('MAIL_PORT')
    kwargs['MAIL_USERNAME'] = current_app.config.get('MAIL_USERNAME')
    kwargs['MAIL_PASSWORD'] = current_app.config.get('MAIL_PASSWORD')
    return render_template("dashboard/settings.html", **kwargs)