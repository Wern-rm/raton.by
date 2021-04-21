from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.pages import Pages
from app.views.dashboard import bp


@bp.route('/page/delete/<int:page_id>', methods=['GET'])
@login_required
@dashboard_controller
def page_delete(page_id: int):
    try:
        db.session.query(Pages).filter(Pages.id == page_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.pages', action='success', id=22))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.pages', action='error', id=999))