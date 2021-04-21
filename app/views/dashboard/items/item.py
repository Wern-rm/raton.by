from flask import render_template, redirect, url_for, current_app, request
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_items import ItemsFile, ItemsImage
from app.models.item_files import ItemFiles
from app.models.item_images import ItemImages
from app.models.items import Items
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp


@bp.route('/item/<int:item_id>', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def item(item_id: int, **kwargs):
    data_item = db.session.query(Items).filter(Items.id == item_id).first()

    form_images = ItemsImage()
    if form_images.validate_on_submit() and request.form['form-id'] == '1':
        try:
            uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=IMAGES)
            filename = uploader.save(file=form_images.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(ItemImages(item_id=item_id, url=file_url))
            db.session.commit()
            return redirect(url_for('dashboard.item', item_id=item_id, action='success', id=24))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.item', item_id=item_id, action='error', id=13))

    form_files = ItemsFile()
    if form_files.validate_on_submit() and request.form['form-id'] == '2':
        try:
            RATON = ['rtf', 'odf', 'ods', 'pdf', 'abw', 'doc', 'docx', 'xls', 'xlsx', 'dwg', 'jpg']
            uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=RATON)
            filename = uploader.save(file=form_files.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(ItemFiles(name=form_files.name.data, item_id=item_id, url=file_url))
            db.session.commit()
            return redirect(url_for('dashboard.item', item_id=item_id, action='success', id=25))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.item', item_id=item_id, action='error', id=14))

    kwargs['title'] = 'Продукт - ' + data_item.title
    kwargs['form_images'] = form_images
    kwargs['form_files'] = form_files
    kwargs['data_item'] = data_item
    kwargs['images'] = db.session.query(ItemImages).filter(ItemImages.item_id == item_id).all()
    kwargs['files'] = db.session.query(ItemFiles).filter(ItemFiles.item_id == item_id).all()
    return render_template("dashboard/items/item.html", **kwargs)