import os

from flask import redirect, url_for, current_app
from flask_login import login_required

from app import db, logger
from app.models.leaderships import Leaderships
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/leadership/delete/<int:leadership_id>', methods=['GET'])
@login_required
@dashboard_controller
def leadership_delete(leadership_id: int):
    try:
        delete = db.session.query(Leaderships).filter(Leaderships.id == leadership_id).first()
        db.session.delete(delete)
        filename = delete.url
        if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), filename)):
            os.remove(os.path.join(current_app.config.get('STATIC_APP'), filename))
        db.session.commit()
        return redirect(url_for('dashboard.leaderships', action='success', id=22))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.leaderships', action='error', id=999))