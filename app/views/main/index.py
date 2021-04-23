import bdb

from flask import render_template
from app.views.main import bp
from app.controllers.app_controller import app_controller
from app.models.sliders import Sliders
from app import db
from app.models.items_category import ItemsCategory
from app.models.clients import Clients


@bp.route('/')
@app_controller
def index(**kwargs):
    kwargs['title'] = 'Главная'
    kwargs['sliders'] = db.session.query(Sliders).filter(Sliders.status == 1).all()
    kwargs['category'] = db.session.query(ItemsCategory).filter(ItemsCategory.status == 1).all()
    kwargs['clients'] = db.session.query(Clients).filter(Clients.status == 1).order_by(Clients.name).all()
    return render_template("default/index.html", **kwargs)


@bp.route('/yandex_4770903cc86d8d80.html')
def yandex_verifications():

    return """
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            </head>
            <body>Verification: 4770903cc86d8d80</body>
        </html>
    """
