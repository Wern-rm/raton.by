import os

from flask import render_template, redirect, url_for, current_app, request
from flask_login import login_required

from app import db, logger
from app.forms.dashboard_items import ItemsCategoryForm
from app.models.items_category import ItemsCategory
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/items', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def items(**kwargs):

    form_create_category = ItemsCategoryForm()
    if form_create_category.validate_on_submit() and request.form['form-id'] == '1':
        try:
            db.session.add(ItemsCategory(title=form_create_category.title.data))
            db.session.commit()
            return redirect(url_for('dashboard.items', action='success', id=7))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.items', action='error', id=999))

    form_edit_category = ItemsCategoryForm()
    if form_edit_category.validate_on_submit() and request.form['form-id'] == '2':
        try:
            category_id = int(request.form['category-id'])
            found = db.session.query(ItemsCategory).filter(ItemsCategory.title == form_edit_category.title.data, ItemsCategory.id != category_id).first()
            if not found:
                db.session.query(ItemsCategory).filter(ItemsCategory.id == category_id).update({'title': form_edit_category.title.data})
                db.session.commit()
                return redirect(url_for('dashboard.items', action='success', id=7))
            else:
                return redirect(url_for('dashboard.items', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.items', action='error', id=999))

    kwargs['title'] = 'Управление каталогом продукции'
    kwargs['form_create_category'] = form_create_category
    kwargs['form_edit_category'] = form_edit_category
    kwargs['category'] = db.session.query(ItemsCategory).order_by(ItemsCategory.id).all()
    return render_template("dashboard/items/index.html", **kwargs)