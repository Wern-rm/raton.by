from flask import render_template, redirect, url_for, request, current_app
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_reviews import ReviewsForm
from app.models.reviews import Reviews
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp


@bp.route('/reviews', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def reviews(**kwargs):
    form = ReviewsForm()
    uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=IMAGES)
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            filename = uploader.save(file=form.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(Reviews(name=form.name.data, url=file_url))
            db.session.commit()
            return redirect(url_for('dashboard.reviews', action='success', id=7))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.reviews', action='error', id=999))

    kwargs['title'] = 'Управление отзывами'
    kwargs['form'] = form
    kwargs['data'] = db.session.query(Reviews).all()
    return render_template("dashboard/reviews.html", **kwargs)