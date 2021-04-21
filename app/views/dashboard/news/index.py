import os

from flask import render_template, redirect, url_for, request, current_app
from flask_login import login_required
from flask_paginate import get_page_args

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_news import NewsForm, NewsCategoryForm, NewsEditForm, NewsEditImageForm
from app.models.news import News
from app.views.dashboard import bp
from app.controllers.pagination import get_pagination
from app.utils.flask_upload_files import UploadFiles, IMAGES
from app.models.news_category import NewsCategory


@bp.route('/news', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def news(**kwargs):
    count = db.session.query(News).count()
    page, per_page, offset = get_page_args(page_parameter='page', per_page_parameter='per_page')
    category = db.session.query(NewsCategory).order_by(NewsCategory.id).all()

    form = NewsForm()
    form.category.choices = [(i.id, i.name) for i in category]
    uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='uploads', extensions=IMAGES)
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            filename = uploader.save(file=form.file.data)
            file_url = uploader.get_path(filename=filename)
            db.session.add(News(title=form.title.data, text=form.text.data, image=file_url, category_id=form.category.data))
            db.session.commit()
            return redirect(url_for('dashboard.news', action='success', id=7))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.news', action='error', id=999))

    form_category = NewsCategoryForm()
    if form_category.validate_on_submit() and request.form['form-id'] == '4':
        try:
            found = db.session.query(NewsCategory).filter(NewsCategory.name == form_category.name.data).first()
            if not found:
                db.session.add(NewsCategory(name=form_category.name.data))
                db.session.commit()
                return redirect(url_for('dashboard.news', action='success', id=7))
            else:
                return redirect(url_for('dashboard.news', action='error', id=7))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.news', action='error', id=999))

    form_edit_category = NewsCategoryForm()
    if form_edit_category.validate_on_submit() and request.form['form-id'] == '5':
        try:
            category_id = int(request.form['category-id'])
            found = db.session.query(NewsCategory).filter(NewsCategory.name == form_edit_category.name.data, NewsCategory.id != category_id).first()
            if not found:
                db.session.query(NewsCategory).filter(NewsCategory.id == category_id).update({'name': form_edit_category.name.data})
                db.session.commit()
                return redirect(url_for('dashboard.news', action='success', id=7))
            else:
                return redirect(url_for('dashboard.news', action='error', id=8))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.news', action='error', id=999))

    form_edit = NewsEditForm()
    form_edit.category.choices = [(i.id, i.name) for i in category]
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            new_id = int(request.form['new-id'])
            db.session.query(News).filter(News.id == new_id).update({
                'title': form_edit.title.data,
                'category_id': form_edit.category.data,
                'text': form_edit.text.data
            })
            db.session.commit()
            return redirect(url_for('dashboard.news', action='success', id=7))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.news', action='error', id=999))

    form_new_edit_photo = NewsEditImageForm()
    if form_new_edit_photo.validate_on_submit() and request.form['form-id'] == '3':
        try:
            new_id = int(request.form['new-id'])
            filename = uploader.save(file=form_new_edit_photo.file.data)
            file_url = uploader.get_path(filename=filename)
            old = db.session.query(News).filter(News.id == new_id).first()
            if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), old.image)):
                os.remove(os.path.join(current_app.config.get('STATIC_APP'), old.image))
            db.session.query(News).filter(News.id == new_id).update({'image': file_url})
            db.session.commit()
            return redirect(url_for('dashboard.news', action='success', id=7))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.news', action='error', id=999))

    kwargs['title'] = 'Управление страницами'
    kwargs['news'] = db.session.query(News).order_by(News.id).limit(per_page).offset(offset).all()
    kwargs['pagination'] = get_pagination(page=page, per_page=per_page, total=count, record_name='items', format_total=True, format_number=True)
    kwargs['form'] = form
    kwargs['category'] = db.session.query(NewsCategory).all()
    kwargs['form_category'] = form_category
    kwargs['form_edit_category'] = form_edit_category
    kwargs['form_edit'] = form_edit
    kwargs['category'] = category
    kwargs['form_new_edit_photo'] = form_new_edit_photo
    return render_template("dashboard/news.html", **kwargs)