from flask import render_template, redirect, url_for, request
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_pages import PagesForm
from app.models.pages import Pages
from app.views.dashboard import bp


@bp.route('/pages', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def pages(**kwargs):

    form = PagesForm()
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            found = db.session.query(Pages).filter(Pages.alias == form.alias.data).first()
            if not found:
                db.session.add(Pages(name=form.name.data, alias=form.alias.data, text=form.text.data))
                db.session.commit()
                return redirect(url_for('dashboard.pages', action='success', id=51))
            else:
                return redirect(url_for('dashboard.pages', action='error', id=27))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.pages', action='warning', id=1))

    form_edit = PagesForm()
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            page_id = int(request.form['page-id'])
            found = db.session.query(Pages).filter(Pages.alias == form_edit.alias.data, Pages.id != page_id).first()
            if not found:
                db.session.query(Pages).filter(Pages.id == page_id).update({
                    'name': form_edit.name.data,
                    'alias': form_edit.alias.data,
                    'text': form_edit.text.data
                })
                db.session.commit()
                return redirect(url_for('dashboard.pages', action='success', id=52))
            else:
                return redirect(url_for('dashboard.pages', action='error', id=27))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.pages', action='warning', id=1))

    kwargs['title'] = 'Управление страницами'
    kwargs['data'] = db.session.query(Pages).order_by(Pages.id).all()
    kwargs['form'] = form
    kwargs['form_edit'] = form_edit
    return render_template("dashboard/pages.html", **kwargs)