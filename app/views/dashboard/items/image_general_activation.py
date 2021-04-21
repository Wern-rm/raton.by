from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.item_images import ItemImages
from app.models.items import Items
from app.models.items_category import ItemsCategory
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/item/image/general/activated/<int:item_id>/<int:image_id>', methods=['GET'])
@login_required
@dashboard_controller
def item_general_image_activated(item_id: int, image_id: int):
    try:
        db.session.query(ItemImages).filter(ItemImages.item_id == item_id).update({'general': 0})
        db.session.commit()
        db.session.query(ItemImages).filter(ItemImages.id == image_id).update({'general': 1})
        db.session.commit()
        return redirect(url_for('dashboard.item', item_id=item_id, action='success', id=20))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.item', item_id=item_id, action='warning', id=1))