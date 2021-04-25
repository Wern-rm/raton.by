from flask import render_template

from app import db
from app.controllers.app_controller import app_controller
from app.models.contacts import Contacts
from app.views.main import bp


@bp.route('/contacts')
@app_controller
def contacts(**kwargs):
    kwargs['title'] = 'Контакты'
    kwargs['contacts'] = db.session.query(Contacts).order_by(Contacts.id).all()
    return render_template("default/contacts.html", **kwargs)