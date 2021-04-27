from flask import render_template, current_app

from app import db
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.shops import Shops
from app.views.main import bp


@bp.route('/shops', methods=['GET', 'POST'])
@app_controller
@question_phone
def shops(**kwargs):
    kwargs['title'] = 'Где купить'
    kwargs['TNP_MAP'] = current_app.config.get('TNP_MAP')
    kwargs['ELECTRO_MAP'] = current_app.config.get('ELECTRO_MAP')
    kwargs['shops1'] = db.session.query(Shops).filter(Shops.status == 1, Shops.type == 1).order_by(Shops.displaying_email.desc(), Shops.displaying_site.desc()).all()
    kwargs['shops2'] = db.session.query(Shops).filter(Shops.status == 1, Shops.type == 2).order_by(Shops.displaying_email.desc(), Shops.displaying_site.desc()).all()
    return render_template("default/shops.html", **kwargs)