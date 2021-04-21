from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.item_images import ItemImages
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/item/image/activated/<int:item_id>/<int:image_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def item_image_activated(item_id: int, image_id: int, status: int):
    try:
        db.session.query(ItemImages).filter(ItemImages.id == image_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.item', item_id=item_id, action='success', id=17))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.item', item_id=item_id, action='warning', id=1))