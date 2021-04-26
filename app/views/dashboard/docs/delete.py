from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.docs import Docs
from app.views.dashboard import bp


@bp.route('/doc/delete/<int:doc_id>', methods=['GET'])
@login_required
@dashboard_controller
def doc_delete(doc_id: int):
    try:
        db.session.query(Docs).filter(Docs.id == doc_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.docs', action='success', id=50))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.docs', action='warning', id=1))