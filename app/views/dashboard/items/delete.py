import os

from flask import redirect, url_for, current_app
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.items import Items
from app.views.dashboard import bp


@bp.route('/item/delete/<int:item_id>', methods=['GET'])
@login_required
@dashboard_controller
def item_delete(item_id: int):
    try:
        # TODO удаляем фотографии, документы и прочее
        db.session.query(Items).filter(Items.id == item_id).delete()
        # filename = delete.image
        # if os.path.exists(os.path.join(current_app.config.get('STATIC_APP'), filename)):
        #     os.remove(os.path.join(current_app.config.get('STATIC_APP'), filename))
        db.session.commit()
        return redirect(url_for('dashboard.items', action='success', id=22))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.items', action='error', id=999))