from datetime import datetime

from flask import render_template, redirect, url_for, request
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_account import EmailEditForm, UsernameEditForm, PasswordForm
from app.models.accounts import Users
from app.views.dashboard import bp


@bp.route('/user/<int:user_id>', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def user(user_id, **kwargs):
    try:
        user_data = db.session.query(Users).filter(Users.id == user_id).first()
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.users', action='error', id=999))

    email_form = EmailEditForm()
    if email_form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            db.session.query(Users).filter(Users.id == user_id).update({'email': email_form.email.data})
            db.session.commit()
            return redirect(url_for('dashboard.user', user_id=user_id, action='success', id=4))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.users', action='error', id=999))

    username_form = UsernameEditForm()
    if username_form.validate_on_submit() and request.form['form-id'] == '2':
        try:
            db.session.query(Users).filter(Users.id == user_id).update({'username': username_form.username.data})
            db.session.commit()
            return redirect(url_for('dashboard.user', user_id=user_id, action='success', id=5))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.users', action='error', id=999))

    password_form = PasswordForm()
    if password_form.validate_on_submit() and request.form['form-id'] == '3':
        try:
            db.session.query(Users).filter(Users.id == user_id).update({
                'password': Users.sha256_base64(password_form.password.data),
                'password_edit_date': datetime.now()
            })
            db.session.commit()
            return redirect(url_for('dashboard.user', user_id=user_id, action='success', id=6))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.users', action='error', id=999))

    kwargs['title'] = 'Управление Пользователем ' + user_data.email
    kwargs['user'] = user_data
    kwargs['email_form'] = email_form
    kwargs['username_form'] = username_form
    kwargs['password_form'] = password_form
    return render_template("dashboard/users/user.html", **kwargs)
