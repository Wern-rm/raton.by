import bdb

from flask import render_template, redirect, url_for, request
from app.views.main import bp
from app.controllers.app_controller import app_controller
from app.models.sliders import Sliders
from app import db, logger
from app.models.items_category import ItemsCategory
from app.models.item_images import ItemImages
from app.models.items import Items
from app.models.item_files import ItemFiles


@bp.route('/item/<int:item_id>')
@app_controller
def item(item_id: int, **kwargs):
    data = db.session.query(Items).filter(Items.id == item_id).first()
    if data.status == 0:
        return redirect(url_for('items'))

    kwargs['title'] = data.title
    kwargs['item'] = data
    kwargs['images'] = db.session.query(ItemImages).filter(ItemImages.item_id == item_id).all()
    kwargs['files'] = db.session.query(ItemFiles).filter(ItemFiles.item_id == item_id).all()

    return render_template("default/item.html", **kwargs)
