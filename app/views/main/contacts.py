from flask import render_template, redirect, url_for

from app import db, logger
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.contacts import Contacts
from app.views.main import bp
from app.forms.main_contacts import CreateMessageForm
from app.models.questions import Questions


@bp.route('/contacts', methods=['GET', 'POST'])
@app_controller
@question_phone
def contacts(**kwargs):
    form = CreateMessageForm()
    if form.validate_on_submit():
        try:
            new = Questions(username=form.name.data,
                            email=form.email.data,
                            phone=form.phone.data,
                            message=form.text.data)
            db.session.add(new)
            db.session.commit()
            return redirect(url_for('main.contacts', action='success', id=131))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('main.contacts', action='error', id=13213))

    kwargs['title'] = 'Контакты'
    kwargs['contacts'] = db.session.query(Contacts).order_by(Contacts.id).all()
    kwargs['form'] = form
    return render_template("default/contacts.html", **kwargs)