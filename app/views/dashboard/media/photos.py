from flask import render_template, redirect, url_for, request, current_app
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_media import MediaPhotos
from app.models.photo_catalogs import PhotoCatalogs
from app.models.photos import Photos
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp


@bp.route('/media/photos/<int:catalog_id>', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def media_photos(catalog_id: int, **kwargs):
    catalog = db.session.query(PhotoCatalogs).filter(PhotoCatalogs.id == catalog_id).first()
    if not catalog:
        return redirect(url_for('dashboard.media'))

    form = MediaPhotos()
    uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=IMAGES)
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            filename = uploader.save(file=form.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(Photos(catalog_id=catalog_id, url=file_url))
            db.session.commit()
            return redirect(url_for('dashboard.media_photos', catalog_id=catalog_id, action='success', id=37))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.media_photos', catalog_id=catalog_id, action='warning', id=1))

    kwargs['title'] = 'Управление медиа'
    kwargs['data'] = db.session.query(Photos).filter(Photos.catalog_id == catalog_id).order_by(Photos.id).all()
    kwargs['form'] = form
    kwargs['catalog'] = catalog
    return render_template("dashboard/media/photos.html", **kwargs)