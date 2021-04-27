from flask import render_template
from sqlalchemy import func

from app import db
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.docs import Docs
from app.views.main import bp


@bp.route('/docs', methods=['GET', 'POST'])
@app_controller
@question_phone
def docs(**kwargs):
    kwargs['title'] = 'Документы'
    kwargs['docs'] = db.session.query(Docs).filter(Docs.status == 1).all()
    kwargs['years'] = db.session.query(Docs).add_columns(func.count(Docs.year), Docs.year).filter(Docs.status == 1).order_by(Docs.year.desc()).group_by(Docs.year).all()
    return render_template("default/docs.html", **kwargs)