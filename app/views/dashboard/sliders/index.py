import os

from flask import render_template, redirect, url_for, current_app
from flask_login import login_required

from app import db, logger
from app.forms.dashboard_slider import SliderForm
from app.models.sliders import Sliders
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/sliders', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def sliders(**kwargs):
    form = SliderForm()
    uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=IMAGES)
    if form.validate_on_submit():
        try:
            filename = uploader.save(file=form.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(Sliders(url=file_url))
            db.session.commit()
            return redirect(url_for('dashboard.sliders', action='success', id=21))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.sliders', action="error", id=999))

    kwargs['title'] = 'Управление слайдером'
    kwargs['data'] = db.session.query(Sliders).order_by(Sliders.id.desc()).all()
    kwargs['form'] = form
    return render_template("dashboard/sliders.html", **kwargs)