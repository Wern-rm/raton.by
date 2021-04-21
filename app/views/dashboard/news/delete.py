import os

from flask import redirect, url_for, current_app
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.news import News
from app.views.dashboard import bp


@bp.route('/new/delete/<int:new_id>', methods=['GET'])
@login_required
@dashboard_controller
def new_delete(new_id: int):
    try:
        delete = db.session.query(News).filter(News.id == new_id).first()
        db.session.delete(delete)
        filename = delete.image
        if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), filename)):
            os.remove(os.path.join(current_app.config.get('STATIC_APP'), filename))
        db.session.commit()
        return redirect(url_for('dashboard.news', action='success', id=22))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.news', action='error', id=999))