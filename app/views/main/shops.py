from flask import render_template

from app import db
from app.controllers.app_controller import app_controller
from app.models.shops import Shops
from app.views.main import bp


@bp.route('/shops')
@app_controller
def shops(**kwargs):
    kwargs['title'] = 'Где купить'
    kwargs['shops1'] = db.session.query(Shops).filter(Shops.status == 1, Shops.type == 1).order_by(Shops.displaying_email.desc(), Shops.displaying_site.desc()).all()
    kwargs['shops2'] = db.session.query(Shops).filter(Shops.status == 1, Shops.type == 2).order_by(Shops.displaying_email.desc(), Shops.displaying_site.desc()).all()
    return render_template("default/shops.html", **kwargs)