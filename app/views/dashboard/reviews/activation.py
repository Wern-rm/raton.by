from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.reviews import Reviews
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/review/activated/<int:review_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def review_activated(review_id: int, status: int):
    try:
        db.session.query(Reviews).filter(Reviews.id == review_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.reviews', action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.reviews', action='error', id=999))