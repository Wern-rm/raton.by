import os

from flask import redirect, url_for, current_app
from flask_login import login_required

from app import db, logger
from app.models.photos import Photos
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/photo/delete/<int:photo_id>/<int:catalog_id>', methods=['GET'])
@login_required
@dashboard_controller
def photo_delete(photo_id: int, catalog_id: int):
    try:
        delete = db.session.query(Photos).filter(Photos.id == photo_id).first()
        db.session.delete(delete)
        filename = delete.url
        if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), filename)):
            os.remove(os.path.join(current_app.config.get('STATIC_APP'), filename))
        db.session.commit()
        return redirect(url_for('dashboard.media_photos', catalog_id=catalog_id, action='success', id=36))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.media_photos', catalog_id=catalog_id, action='warning', id=1))