from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.clients import Clients
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/client/activated/<int:client_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def client_activated(client_id: int, status: int):
    try:
        db.session.query(Clients).filter(Clients.id == client_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.clients', action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.clients', action='error', id=999))