from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.news import News
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/new/activated/<int:new_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def new_activated(new_id: int, status: int):
    try:
        db.session.query(News).filter(News.id == new_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.news', action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.news', action='error', id=999))