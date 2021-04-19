# -*- coding: utf-8 -*-
__author__ = 'WeRn'

from functools import wraps
from flask_login import current_user
from flask import redirect, url_for, session, current_app


def dashboard_controller(func):
    @wraps(func)
    def decorated_view(*args, **kwargs):
        if session.get('version') is None:
            session['version'] = current_app.config.get('VERSION')

        if session.get('server_name') is None:
            session['server_name'] = current_app.config.get('PROJECT_NAME')

        if not current_user.is_authenticated:
            return redirect(url_for('main.index'))

        if current_user.is_banned == 1:
            return redirect(url_for('main.index'))

        return func(*args, **kwargs)
    return decorated_view
