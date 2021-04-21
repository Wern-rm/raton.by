import os

from flask import redirect, url_for, current_app
from flask_login import login_required

from app import db, logger
from app.models.sliders import Sliders
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/slider/delete/<int:slider_id>', methods=['GET'])
@login_required
@dashboard_controller
def slider_delete(slider_id: int):
    try:
        delete = db.session.query(Sliders).filter(Sliders.id == slider_id).first()
        db.session.delete(delete)
        filename = delete.url
        if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), filename)):
            os.remove(os.path.join(current_app.config.get('STATIC_APP'), filename))
        db.session.commit()
        return redirect(url_for('dashboard.sliders', action='success', id=60))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.index', action='warning', id=1))