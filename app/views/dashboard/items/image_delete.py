import os

from flask import redirect, url_for, current_app
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.item_images import ItemImages
from app.views.dashboard import bp


@bp.route('/item/image/delete/<int:image_id>/<int:item_id>', methods=['GET'])
@login_required
@dashboard_controller
def item_image_delete(image_id: int, item_id: int):
    try:
        delete = db.session.query(ItemImages).filter(ItemImages.id == image_id).first()
        db.session.delete(delete)
        filename = delete.url
        if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), filename)):
            os.remove(os.path.join(current_app.config.get('STATIC_APP'), filename))
        db.session.commit()
        return redirect(url_for('dashboard.item', item_id=item_id, action='success', id=19))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.item', item_id=item_id, action='warning', id=1))