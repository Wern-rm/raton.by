from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.item_images import ItemImages
from app.models.items import Items
from app.models.items_category import ItemsCategory
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/item/image/catalog/activated/<int:item_id>/<int:image_id>', methods=['GET'])
@login_required
@dashboard_controller
def item_category_image_activated(item_id: int, image_id: int):
    try:
        image = db.session.query(ItemImages).filter(ItemImages.id == image_id).first()
        item = db.session.query(Items).filter(Items.id == image.item_id).first()
        db.session.query(ItemsCategory).filter(ItemsCategory.id == item.category_id).update({'image': image.url})
        db.session.commit()
        return redirect(url_for('dashboard.item', item_id=item_id, action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.item', item_id=item_id, action='error', id=999))