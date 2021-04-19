from flask import render_template, redirect, url_for
from flask_login import login_required
from flask_paginate import get_page_args

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.controllers.pagination import get_pagination
from app.forms.dashboard_registrations import RegistrationsForm
from app.models.accounts import Users
from app.views.dashboard import bp


@bp.route('/users', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def users(**kwargs):
    count = db.session.query(Users).count()
    page, per_page, offset = get_page_args(page_parameter='page', per_page_parameter='per_page')

    form = RegistrationsForm()
    if form.validate_on_submit():
        try:
            found = db.session.query(Users).filter(Users.email == form.email.data).first()
            if not found:
                # добавляем аккаунт в базу
                new = Users(email=form.email.data, password=form.password.data, username=form.username.data, activated=True)
                db.session.add(new)
                db.session.commit()
                return redirect(url_for('dashboard.users', action='success', id=7))
            else:
                return redirect(url_for('dashboard.users', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.users', action='error', id=999))

    kwargs['title'] = 'Управление Пользователями'
    kwargs['user_count'] = count
    kwargs['page'] = page
    kwargs['per_page'] = per_page
    kwargs['offset'] = offset
    kwargs['users'] = db.session.query(Users).order_by(Users.id.desc()).limit(per_page).offset(offset).all()
    kwargs['pagination'] = get_pagination(page=page, per_page=per_page, total=count, record_name='items', format_total=True, format_number=True)
    kwargs['form'] = form
    return render_template("dashboard/users.html", **kwargs)