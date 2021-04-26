from flask import render_template, redirect, url_for, current_app, request
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_docs import DocsForm
from app.models.item_files import ItemFiles
from app.models.docs import Docs
from app.models.items import Items
from app.utils.flask_upload_files import UploadFiles, DOCUMENTS
from app.views.dashboard import bp
from datetime import datetime


@bp.route('/docs', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def docs(**kwargs):
    form = DocsForm()
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads/docs', extensions=DOCUMENTS)
            filename = uploader.save(file=form.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(Docs(name=form.name.data, year=form.year.data, url=file_url))
            db.session.commit()
            return redirect(url_for('dashboard.docs', action='success', id=1321))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.docs', action='warning', id=1))


    kwargs['title'] = 'Документы'
    kwargs['form'] = form
    kwargs['current_form_year'] = datetime.now().year
    kwargs['docs'] = db.session.query(Docs).all()
    return render_template("dashboard/docs.html", **kwargs)