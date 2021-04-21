from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.photos import Photos
from app.models.photo_catalogs import PhotoCatalogs
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/photo/activated/<int:photo_id>/<int:catalog_id>', methods=['GET'])
@login_required
@dashboard_controller
def photo_activated_general(photo_id: int, catalog_id: int):
    try:
        photo = db.session.query(Photos).filter(Photos.id == photo_id).first()
        db.session.query(PhotoCatalogs).filter(PhotoCatalogs.id == catalog_id).update({'url': photo.url})
        db.session.commit()
        return redirect(url_for('dashboard.media_photos', catalog_id=catalog_id, action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.media_photos', catalog_id=catalog_id, action='error', id=999))