from flask import render_template, redirect, url_for, request

from app import db, logger
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.photo_catalogs import PhotoCatalogs
from app.models.photos import Photos
from app.views.main import bp


@bp.route('/photos', methods=['GET', 'POST'])
@app_controller
@question_phone
def photos(**kwargs):
    catalog_id = 0
    is_photos = False
    try:
        if request.args.get('catalog_id') is not None and request.args.get('catalog_id') != '':
            catalog_id = int(request.args.get('catalog_id'))
            is_photos = True
    except Exception as e:
        logger.error(e)
        return redirect(url_for('main.photos'))

    if catalog_id > 0:
        catalog = db.session.query(PhotoCatalogs).filter(PhotoCatalogs.id == catalog_id).first()
        if catalog.status == 0:
            return redirect(url_for('main.photos'))
        kwargs['is_photos'] = is_photos
        kwargs['photos'] = db.session.query(Photos).filter(Photos.catalog_id == catalog_id, Photos.status == 1).all()
        kwargs['catalog'] = catalog

    kwargs['title'] = 'Фотогалерея'
    kwargs['catalogs'] = db.session.query(PhotoCatalogs).filter(PhotoCatalogs.status == 1).order_by(PhotoCatalogs.name).all()
    return render_template("default/photos.html", **kwargs)