from flask import render_template, redirect, url_for, request
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_pages import PagesForm
from app.models.pages import Pages
from app.views.dashboard import bp


@bp.route('/page/edit/<int:page_id>', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def page_edit(page_id, **kwargs):
    page = db.session.query(Pages).filter(Pages.id == page_id).first()

    form = PagesForm()
    if form.validate_on_submit():
        try:
            found = db.session.query(Pages).filter(Pages.alias == form.alias.data, Pages.id != page_id).first()
            if not found:
                db.session.query(Pages).filter(Pages.id == page_id).update({
                    'name': form.name.data,
                    'alias': form.alias.data,
                    'text': form.text.data
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
    kwargs['form'] = form
    kwargs['page'] = page
    return render_template("dashboard/pages/edit.html", **kwargs)