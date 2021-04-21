from flask import render_template, redirect, url_for, request
from flask_login import login_required
from flask_paginate import get_page_args

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.controllers.pagination import get_pagination
from app.forms.dashboard_items import ItemsCategoryForm, ItemsForm
from app.models.items import Items
from app.models.items_category import ItemsCategory
from app.views.dashboard import bp


@bp.route('/items', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def items(**kwargs):
    category = db.session.query(ItemsCategory).order_by(ItemsCategory.id).all()
    count = db.session.query(Items).count()
    page, per_page, offset = get_page_args(page_parameter='page', per_page_parameter='per_page')

    form_create_category = ItemsCategoryForm()
    if form_create_category.validate_on_submit() and request.form['form-id'] == '1':
        try:
            db.session.add(ItemsCategory(title=form_create_category.title.data))
            db.session.commit()
            return redirect(url_for('dashboard.items', action='success', id=21))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.items', action='error', id=7))

    form_edit_category = ItemsCategoryForm()
    if form_edit_category.validate_on_submit() and request.form['form-id'] == '2':
        try:
            category_id = int(request.form['category-id'])
            found = db.session.query(ItemsCategory).filter(ItemsCategory.title == form_edit_category.title.data, ItemsCategory.id != category_id).first()
            if not found:
                db.session.query(ItemsCategory).filter(ItemsCategory.id == category_id).update({'title': form_edit_category.title.data})
                db.session.commit()
                return redirect(url_for('dashboard.items', action='success', id=22))
            else:
                return redirect(url_for('dashboard.items', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.items', action='error', id=9))

    form_create_item = ItemsForm()
    form_create_item.category_id.choices = [(i.id, i.title) for i in category]
    if form_create_item.validate_on_submit() and request.form['form-id'] == '3':
        try:
            db.session.add(Items(title=form_create_item.title.data,
                                 text=form_create_item.text.data,
                                 category_id=form_create_item.category_id.data))
            db.session.commit()
            return redirect(url_for('dashboard.items', action='success', id=23))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.items', action='error', id=10))

    form_edit_item = ItemsForm()
    form_edit_item.category_id.choices = [(i.id, i.title) for i in category]
    if form_edit_item.validate_on_submit() and request.form['form-id'] == '4':
        try:
            item_id = int(request.form['item-id'])
            found = db.session.query(Items).filter(Items.title == form_edit_item.title.data, Items.id != item_id).first()
            if not found:
                db.session.query(Items).filter(Items.id == item_id).update({
                    'title': form_edit_item.title.data,
                    'category_id': form_edit_item.category_id.data,
                    'text': form_edit_item.text.data
                })
                db.session.commit()
                return redirect(url_for('dashboard.items', action='success', id=7))
            else:
                return redirect(url_for('dashboard.items', action='error', id=12))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.items', action='error', id=11))

    kwargs['title'] = 'Управление каталогом продукции'
    kwargs['form_create_category'] = form_create_category
    kwargs['form_edit_category'] = form_edit_category
    kwargs['form_create_item'] = form_create_item
    kwargs['form_edit_item'] = form_edit_item
    kwargs['category'] = category
    kwargs['items'] = db.session.query(Items).order_by(Items.id.desc()).limit(per_page).offset(offset).all()
    kwargs['pagination'] = get_pagination(page=page, per_page=per_page, total=count, record_name='items', format_total=True, format_number=True)
    return render_template("dashboard/items/index.html", **kwargs)