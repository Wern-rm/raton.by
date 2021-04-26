from flask import render_template, redirect, url_for

from app import db
from app.controllers.app_controller import app_controller
from app.models.docs import Docs
from app.views.main import bp


@bp.route('/docs')
@app_controller
def docs(**kwargs):
    kwargs['title'] = 'Документы'
    kwargs['docs'] = db.session.query(Docs).filter(Docs.status == 1).all()
    kwargs['years'] = db.session.query(Docs).filter(Docs.status == 1).order_by(Docs.year.desc()).group_by(Docs.year).all()
    return render_template("default/docs.html", **kwargs)