from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.pages import Pages
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/page/activated/<int:page_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def page_activated(page_id: int, status: int):
    try:
        db.session.query(Pages).filter(Pages.id == page_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.pages', action='success', id=49))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.pages', action='warning', id=1))