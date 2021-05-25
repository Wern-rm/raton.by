from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.items_category import ItemsCategory
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/item/category/popular/<int:category_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def item_category_popular(category_id: int, status: int):
    try:
        db.session.query(ItemsCategory).filter(ItemsCategory.id == category_id).update({'is_popular': status})
        db.session.commit()
        return redirect(url_for('dashboard.items', action='success', id=12))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.items', action='warning', id=1))