from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.photo_catalogs import PhotoCatalogs
from app.models.photos import Photos
from app.views.dashboard import bp


@bp.route('/media/delete/<int:catalog_id>', methods=['GET'])
@login_required
@dashboard_controller
def media_delete(catalog_id: int):
    try:
        count = db.session.query(Photos).filter(Photos.catalog_id == catalog_id).count()
        if count != 0:
            return redirect(url_for('dashboard.media', action='error', id=19))
        db.session.query(PhotoCatalogs).filter(PhotoCatalogs.id == catalog_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.media', action='success', id=30))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.media', action='warning', id=1))