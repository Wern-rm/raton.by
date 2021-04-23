# -*- coding: utf-8 -*-
__author__ = 'WeRn'

from functools import wraps
from flask_login import current_user
from flask import redirect, url_for, session, current_app
from datetime import datetime


def app_controller(func):
    @wraps(func)
    def decorated_view(*args, **kwargs):
        kwargs['current_date_year'] = datetime.now().year
        return func(*args, **kwargs)

    return decorated_view
