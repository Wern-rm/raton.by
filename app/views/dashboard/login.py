from datetime import timedelta

from flask import render_template, url_for, redirect, request, session
from flask_login import current_user, login_user

from app import db, logger
from app.forms.dashboard_login import LoginForm
from app.models.accounts import Users
from app.utils.network_utils import get_ip_address
from app.views.dashboard import bp


@bp.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('dashboard.index'))

    form = LoginForm(request.form)
    if form.validate_on_submit():
        try:
            user = db.session.query(Users).filter(Users.email == form.login.data).first()

            if user is None:
                return redirect(url_for('dashboard.login', action_id=0))
            if user.activated == 0:
                return redirect(url_for('dashboard.login', action_id=1))
            if user.is_banned == 1:
                return redirect(url_for('dashboard.login', action_id=2))
            if user.password != Users.sha256_base64(form.password.data):
                return redirect(url_for('dashboard.login', action_id=3))

            login_user(user=user, remember=False, duration=timedelta(minutes=60))
            db.session.query(Users).filter(Users.id == user.id).update({
                'last_ip': get_ip_address(),
                'session_id': session.get('_session_id')
            })
            db.session.commit()
            return redirect(url_for('dashboard.index'))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.login', action_id=999))
    kwargs = {
        'title': 'Авторизация',
        'form': form
    }
    return render_template("dashboard/login.html", **kwargs)
