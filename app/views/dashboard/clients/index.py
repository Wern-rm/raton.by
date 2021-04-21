import os

from flask import render_template, redirect, url_for, request, current_app
from flask_login import login_required
from flask_paginate import get_page_args


from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_clients import ClientsEditForm, ClientsEditPhotoForm, ClientsForm
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp
from app.controllers.pagination import get_pagination
from app.models.clients import Clients


@bp.route('/clients', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def clients(**kwargs):
    count = db.session.query(Clients).count()
    page, per_page, offset = get_page_args(page_parameter='page', per_page_parameter='per_page')

    form = ClientsForm()
    uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=IMAGES)
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            found = db.session.query(Clients).filter(Clients.name == form.name.data).first()
            if not found:
                filename = uploader.save(file=form.file.data)
                file_url = uploader.get_path(filename=filename)
                new = Clients(name=form.name.data,
                              category=form.category.data,
                              url=file_url)
                db.session.add(new)
                db.session.commit()
                return redirect(url_for('dashboard.clients', action='success', id=7))
            else:
                return redirect(url_for('dashboard.clients', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.clients', action='error', id=999))

    form_edit = ClientsEditForm()
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            client_id = int(request.form['client-id'])
            found = db.session.query(Clients).filter(Clients.name == form_edit.name.data, Clients.id != client_id).first()
            if not found:
                db.session.query(Clients).filter(Clients.id == client_id).update({
                    'name': form_edit.name.data,
                    'category': form_edit.category.data
                })
                db.session.commit()
                return redirect(url_for('dashboard.clients', action='success', id=7))
            else:
                return redirect(url_for('dashboard.clients', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.clients', action='error', id=999))

    form_edit_photo = ClientsEditPhotoForm()
    if form_edit_photo.validate_on_submit() and request.form['form-id'] == '3':
        try:
            client_id = int(request.form['client-id'])
            filename = uploader.save(file=form_edit_photo.file.data)
            file_url = uploader.get_path(filename=filename)
            old = db.session.query(Clients).filter(Clients.id == client_id).first()
            if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), old.url)):
                os.remove(os.path.join(current_app.config.get('STATIC_APP'), old.url))
            db.session.query(Clients).filter(Clients.id == client_id).update({'url': file_url})
            db.session.commit()
            return redirect(url_for('dashboard.clients', action='success', id=7))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.clients', action='error', id=999))

    kwargs['title'] = 'Управление клиентами'
    kwargs['counts'] = count
    kwargs['page'] = page
    kwargs['per_page'] = per_page
    kwargs['offset'] = offset
    kwargs['clients'] = db.session.query(Clients).order_by(Clients.id.desc()).limit(per_page).offset(offset).all()
    kwargs['pagination'] = get_pagination(page=page, per_page=per_page, total=count, record_name='items', format_total=True, format_number=True)
    kwargs['form'] = form
    kwargs['form_edit'] = form_edit
    kwargs['form_edit_photo'] = form_edit_photo
    return render_template("dashboard/clients.html", **kwargs)