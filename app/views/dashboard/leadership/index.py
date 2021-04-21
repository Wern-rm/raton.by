import os

from flask import render_template, redirect, url_for, request, current_app
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_leaderships import LeadershipsForm, LeadershipsEditForm, LeadershipsEditPhotoForm
from app.models.leaderships import Leaderships
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp


@bp.route('/leaderships', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def leaderships(**kwargs):
    form = LeadershipsForm()
    uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=IMAGES)
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            found = db.session.query(Leaderships).filter(Leaderships.username == form.username.data).first()
            if not found:
                filename = uploader.save(file=form.file.data)
                file_url = uploader.get_path(filename=filename)
                new = Leaderships(post=form.post.data,
                                  username=form.username.data,
                                  url=file_url,
                                  phone=form.phone.data,
                                  fax=form.fax.data,
                                  email=form.email.data)
                db.session.add(new)
                db.session.commit()
                return redirect(url_for('dashboard.leaderships', action='success', id=26))
            else:
                return redirect(url_for('dashboard.leaderships', action='error', id=15))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.leaderships', action='error', id=16))

    form_edit = LeadershipsEditForm()
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            leadership_id = int(request.form['leadership-id'])
            found = db.session.query(Leaderships).filter(Leaderships.username == form_edit.username.data, Leaderships.id != leadership_id).first()
            if not found:
                db.session.query(Leaderships).filter(Leaderships.id == leadership_id).update({
                    'post': form_edit.post.data,
                    'username': form_edit.username.data,
                    'phone': form_edit.phone.data,
                    'fax': form_edit.fax.data,
                    'email': form_edit.email.data
                })
                db.session.commit()
                return redirect(url_for('dashboard.leaderships', action='success', id=27))
            else:
                return redirect(url_for('dashboard.leaderships', action='error', id=15))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.leaderships', action='error', id=17))

    form_edit_photo = LeadershipsEditPhotoForm()
    if form_edit_photo.validate_on_submit() and request.form['form-id'] == '3':
        try:
            leadership_id = int(request.form['leadership-id'])
            filename = uploader.save(file=form_edit_photo.file.data)
            file_url = uploader.get_path(filename=filename)
            old = db.session.query(Leaderships).filter(Leaderships.id == leadership_id).first()
            if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), old.url)):
                os.remove(os.path.join(current_app.config.get('STATIC_APP'), old.url))
            db.session.query(Leaderships).filter(Leaderships.id == leadership_id).update({'url': file_url})
            db.session.commit()
            return redirect(url_for('dashboard.leaderships', action='success', id=28))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.leaderships', action='error', id=18))

    kwargs['title'] = 'Управление руководителями'
    kwargs['data'] = db.session.query(Leaderships).order_by(Leaderships.id).all()
    kwargs['form'] = form
    kwargs['form_edit'] = form_edit
    kwargs['form_edit_photo'] = form_edit_photo
    return render_template("dashboard/leaderships.html", **kwargs)