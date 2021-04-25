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
from app.forms.main_item_application import ItemApplicationForm
from app.models.item_application import ItemApplications


@bp.route('/item/<int:item_id>', methods=['GET', 'POST'])
@app_controller
def item(item_id: int, **kwargs):
    data = db.session.query(Items).filter(Items.id == item_id).first()
    if data.status == 0:
        return redirect(url_for('items'))

    form = ItemApplicationForm()
    if form.validate_on_submit():
        try:
            new = ItemApplications(item_id=item_id,
                                   name=form.name.data,
                                   phone=form.phone.data,
                                   email=form.email.data,
                                   comment=form.message.data)
            db.session.add(new)
            db.session.commit()
            return redirect(url_for('main.item', item_id=item_id, action='success', id=123))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('main.item', item_id=item_id, action='warning', id=123))

    kwargs['title'] = data.title
    kwargs['form'] = form
    kwargs['item'] = data
    kwargs['images'] = db.session.query(ItemImages).filter(ItemImages.item_id == item_id).all()
    kwargs['files'] = db.session.query(ItemFiles).filter(ItemFiles.item_id == item_id).all()

    return render_template("default/item.html", **kwargs)
