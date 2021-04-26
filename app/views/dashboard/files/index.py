from datetime import datetime

from flask import render_template, redirect, url_for, current_app, request
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_files import FilesForm
from app.models.files import Files
from app.utils.flask_upload_files import UploadFiles, ALL
from app.views.dashboard import bp


@bp.route('/files', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def files(**kwargs):
    form = FilesForm()
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads/files', extensions=ALL)
            filename = uploader.save(file=form.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(Files(name=form.name.data, url=file_url))
            db.session.commit()
            return redirect(url_for('dashboard.files', action='success', id=1321))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.files', action='warning', id=1))


    kwargs['title'] = 'Загрузки'
    kwargs['form'] = form
    kwargs['files'] = db.session.query(Files).all()
    return render_template("dashboard/files.html", **kwargs)