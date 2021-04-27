# -*- coding: utf-8 -*-
__author__ = 'WeRn'

from functools import wraps
from flask_login import current_user
from flask import redirect, url_for, session, current_app, request
from datetime import datetime
from app.forms.main_phone import PhoneQuestionForm
from app import db, logger
from app.models.phone_questions import PhoneQuestions


def question_phone(func):
    @wraps(func)
    def decorated_view(*args, **kwargs):

        form_phone = PhoneQuestionForm()
        if form_phone.validate_on_submit() and request.form['form-id'] == '99':
            try:
                db.session.add(PhoneQuestions(name=form_phone.name.data, phone=form_phone.phone.data))
                db.session.commit()
                return redirect(url_for('main.index', action='success', id=12345))
            except Exception as e:
                db.session.rollback()
                logger.error(e)
                return redirect(url_for('main.index', action='error', id=12313))

        kwargs['form_phone'] = form_phone
        kwargs['current_date_year'] = datetime.now().year
        return func(*args, **kwargs)

    return decorated_view
