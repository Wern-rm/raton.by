from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.videos import Videos
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/video/activated/<int:video_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def video_activated(video_id: int, status: int):
    try:
        db.session.query(Videos).filter(Videos.id == video_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.media', action='success', id=38))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.media', action='warning', id=1))