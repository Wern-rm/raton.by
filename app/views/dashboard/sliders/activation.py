from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.sliders import Sliders
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/slider/activated/<int:slider_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def slider_activated(slider_id: int, status: int):
    try:
        db.session.query(Sliders).filter(Sliders.id == slider_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.sliders', action='success', id=59))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.index', action='warning', id=1))