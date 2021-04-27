from flask import render_template

from app import db
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.clients import Clients
from app.views.main import bp


@bp.route('/clients', methods=['GET', 'POST'])
@app_controller
@question_phone
def clients(**kwargs):
    kwargs['title'] = 'Клиенты'
    kwargs['clients'] = db.session.query(Clients).filter(Clients.status == 1).all()
    return render_template("default/clients.html", **kwargs)