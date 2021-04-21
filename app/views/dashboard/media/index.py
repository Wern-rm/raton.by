import os

from flask import render_template, redirect, url_for, request, current_app
from flask_login import login_required
from flask_paginate import get_page_args


from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_media import PhotoCatalogsForm, MediaVideos
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp
from app.controllers.pagination import get_pagination
from app.models.photo_catalogs import PhotoCatalogs
from app.models.videos import Videos


@bp.route('/media', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def media(**kwargs):
    count_photo = db.session.query(PhotoCatalogs).count()
    count_video = db.session.query(Videos).count()
    page_photo, per_page_photo, offset_photo = get_page_args(page_parameter='page', per_page_parameter='per_page')
    page_video, per_page_video, offset_video = get_page_args(page_parameter='page', per_page_parameter='per_page')

    form = PhotoCatalogsForm()
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            found = db.session.query(PhotoCatalogs).filter(PhotoCatalogs.name == form.name.data).first()
            if not found:
                db.session.add(PhotoCatalogs(name=form.name.data))
                db.session.commit()
                return redirect(url_for('dashboard.media', action='success', id=7))
            else:
                return redirect(url_for('dashboard.media', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.media', action='error', id=999))

    form_edit = PhotoCatalogsForm()
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            catalog_id = int(request.form['catalog-id'])
            found = db.session.query(PhotoCatalogs).filter(PhotoCatalogs.name == form_edit.name.data, PhotoCatalogs.id != catalog_id).first()
            if not found:
                db.session.query(PhotoCatalogs).filter(PhotoCatalogs.id == catalog_id).update({'name': form_edit.name.data})
                db.session.commit()
                return redirect(url_for('dashboard.media', action='success', id=7))
            else:
                return redirect(url_for('dashboard.media', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.media', action='error', id=999))

    form_video = MediaVideos()
    if form_video.validate_on_submit() and request.form['form-id'] == '3':
        try:
            found = db.session.query(Videos).filter(Videos.name == form_video.name.data).first()
            if not found:
                db.session.add(Videos(name=form_video.name.data, url=form_video.url.data))
                db.session.commit()
                return redirect(url_for('dashboard.media', action='success', id=7))
            else:
                return redirect(url_for('dashboard.media', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.media', action='error', id=999))

    kwargs['title'] = 'Управление медиа'
    kwargs['photo_catalogs'] = db.session.query(PhotoCatalogs).order_by(PhotoCatalogs.id).limit(per_page_photo).offset(offset_photo).all()
    kwargs['pagination_photo'] = get_pagination(page=page_photo, per_page=per_page_photo, total=count_photo, record_name='items', format_total=True, format_number=True)
    kwargs['videos'] = db.session.query(Videos).order_by(Videos.id).limit(per_page_video).offset(offset_video).all()
    kwargs['pagination_video'] = get_pagination(page=page_video, per_page=per_page_video, total=count_video, record_name='items', format_total=True, format_number=True)
    kwargs['form'] = form
    kwargs['form_edit'] = form_edit
    kwargs['form_video'] = form_video
    return render_template("dashboard/media/index.html", **kwargs)