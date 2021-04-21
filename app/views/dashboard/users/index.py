from flask import render_template, redirect, url_for, request
from flask_login import login_required
from flask_paginate import get_page_args

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.controllers.pagination import get_pagination
from app.forms.dashboard_registrations import RegistrationsForm
from app.forms.dashboard_account import UserEditForm, PasswordForm
from app.models.accounts import Users
from app.views.dashboard import bp
from datetime import datetime


@bp.route('/users', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def users(**kwargs):
    count = db.session.query(Users).count()
    page, per_page, offset = get_page_args(page_parameter='page', per_page_parameter='per_page')

    form = RegistrationsForm()
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            found = db.session.query(Users).filter(Users.email == form.email.data).first()
            if not found:
                # добавляем аккаунт в базу
                new = Users(email=form.email.data, password=form.password.data, username=form.username.data, activated=True)
                db.session.add(new)
                db.session.commit()
                return redirect(url_for('dashboard.users', action='success', id=65))
            else:
                return redirect(url_for('dashboard.users', action='error', id=28))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.users', action='warning', id=1))

    form_edit = UserEditForm()
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            user_id = int(request.form['user-id'])
            found = db.session.query(Users).filter(Users.email == form.email.data, Users.id != user_id).first()
            if not found:
                db.session.query(Users).filter(Users.id == user_id).update({
                    'username': form_edit.username.data,
                    'email': form_edit.email.data,
                    'edit_date': datetime.now()
                })
                db.session.commit()
                return redirect(url_for('dashboard.users', action='success', id=66))
            else:
                return redirect(url_for('dashboard.users', action='error', id=28))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.users', action='warning', id=1))

    form_password_edit = PasswordForm()
    if form_password_edit.validate_on_submit() and request.form['form-id'] == '3':
        try:
            user_id = int(request.form['user-id'])
            db.session.query(Users).filter(Users.id == user_id).update({
                'password': Users.sha256_base64(form_password_edit.password.data),
                'edit_date': datetime.now()
            })
            db.session.commit()
            return redirect(url_for('dashboard.users', action='success', id=67))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.users', action='warning', id=11))

    kwargs['title'] = 'Управление Пользователями'
    kwargs['user_count'] = count
    kwargs['page'] = page
    kwargs['per_page'] = per_page
    kwargs['offset'] = offset
    kwargs['users'] = db.session.query(Users).order_by(Users.id.desc()).limit(per_page).offset(offset).all()
    kwargs['pagination'] = get_pagination(page=page, per_page=per_page, total=count, record_name='items', format_total=True, format_number=True)
    kwargs['form'] = form
    kwargs['form_edit'] = form_edit
    kwargs['form_password_edit'] = form_password_edit
    return render_template("dashboard/users.html", **kwargs)