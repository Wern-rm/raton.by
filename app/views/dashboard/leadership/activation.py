from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.leaderships import Leaderships
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/leadership/activated/<int:leadership_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def leadership_activated(leadership_id: int, status: int):
    try:
        db.session.query(Leaderships).filter(Leaderships.id == leadership_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.leaderships', action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.leaderships', action='error', id=999))