from flask import render_template

from app import db
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.leaderships import Leaderships
from app.views.main import bp


@bp.route('/staff', methods=['GET', 'POST'])
@app_controller
@question_phone
def staff(**kwargs):
    kwargs['title'] = 'Руководство'
    kwargs['staff'] = db.session.query(Leaderships).filter(Leaderships.status == 1).order_by(Leaderships.id).all()
    return render_template("default/staff.html", **kwargs)