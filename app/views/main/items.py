from flask import render_template, redirect, url_for, request

from app import db, logger
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.item_images import ItemImages
from app.models.items import Items
from app.models.items_category import ItemsCategory
from app.views.main import bp


@bp.route('/items', methods=['GET', 'POST'])
@app_controller
@question_phone
def items(**kwargs):
    category_id = 0
    is_items = False
    try:
        if request.args.get('category_id') is not None and request.args.get('category_id') != '':
            category_id = int(request.args.get('category_id'))
            is_items = True
    except Exception as e:
        logger.error(e)
        return redirect(url_for('main.items'))

    if category_id > 0:
        kwargs['is_items'] = is_items
        kwargs['items'] = db.session.query(Items).filter(Items.category_id == category_id, Items.status == 1).all()
        kwargs['general_images'] = db.session.query(ItemImages).filter(ItemImages.general == 1).all()
        kwargs['category_id'] = category_id

    kwargs['title'] = 'Наша продукция'
    kwargs['category'] = db.session.query(ItemsCategory).filter(ItemsCategory.status == 1).all()
    return render_template("default/items.html", **kwargs)
