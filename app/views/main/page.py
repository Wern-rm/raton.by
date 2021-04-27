from flask import render_template, redirect, url_for

from app import db
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.pages import Pages
from app.views.main import bp


@bp.route('/page/<string:alias>', methods=['GET', 'POST'])
@app_controller
@question_phone
def page(alias, **kwargs):
    data = db.session.query(Pages).filter(Pages.alias == alias, Pages.status == 1).first()
    if not data or data is None:
        return redirect(url_for('main.index'))

    kwargs['title'] = data.name
    kwargs['page'] = data
    return render_template("default/page.html", **kwargs)