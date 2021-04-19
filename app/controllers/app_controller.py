# -*- coding: utf-8 -*-
__author__ = 'WeRn'

from functools import wraps
from flask_login import current_user
from flask import redirect, url_for, session, current_app


def app_controller(func):
    @wraps(func)
    def decorated_view(*args, **kwargs):

        return func(*args, **kwargs)

    return decorated_view
