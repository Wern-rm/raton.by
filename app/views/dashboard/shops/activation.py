from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.shops import Shops
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/shop/activated/<int:shop_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def shop_activated(shop_id: int, status: int):
    try:
        db.session.query(Shops).filter(Shops.id == shop_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.shops', action='success', id=56))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.shops', action='warning', id=1))