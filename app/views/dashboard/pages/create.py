from flask import render_template, redirect, url_for, request
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_pages import PagesForm
from app.models.pages import Pages
from app.views.dashboard import bp


@bp.route('/page/create', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def page_create(**kwargs):

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

    kwargs['title'] = 'Управление страницами'
    kwargs['form'] = form
    return render_template("dashboard/pages/create.html", **kwargs)