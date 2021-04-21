from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.photo_catalogs import PhotoCatalogs
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/media/activated/<int:catalog_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def media_activated(catalog_id: int, status: int):
    try:
        db.session.query(PhotoCatalogs).filter(PhotoCatalogs.id == catalog_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.media', action='success', id=29))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.media', action='warning', id=1))