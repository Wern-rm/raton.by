from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.docs import Docs
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/docs/activated/<int:doc_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def doc_activated(doc_id: int, status: int):
    try:
        db.session.query(Docs).filter(Docs.id == doc_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.docs', action='success', id=49))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.docs', action='warning', id=1))