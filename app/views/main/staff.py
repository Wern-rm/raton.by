from flask import render_template

from app import db
from app.controllers.app_controller import app_controller
from app.models.leaderships import Leaderships
from app.views.main import bp


@bp.route('/staff')
@app_controller
def staff(**kwargs):
    kwargs['title'] = 'Руководство'
    kwargs['staff'] = db.session.query(Leaderships).filter(Leaderships.status == 1).order_by(Leaderships.id).all()
    return render_template("default/staff.html", **kwargs)