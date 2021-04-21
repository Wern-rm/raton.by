from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.items import Items
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/item/activated/<int:item_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def item_activated(item_id: int, status: int):
    try:
        db.session.query(Items).filter(Items.id == item_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.items', action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.items', action='error', id=999))