from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.shops import Shops
from app.views.dashboard import bp


@bp.route('/shop/delete/<int:shop_id>', methods=['GET'])
@login_required
@dashboard_controller
def shop_delete(shop_id: int):
    try:
        db.session.query(Shops).filter(Shops.id == shop_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.shops', action='success', id=57))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.shops', action='warning', id=1))