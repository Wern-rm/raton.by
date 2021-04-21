from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.items_category import ItemsCategory
from app.views.dashboard import bp


@bp.route('/item/category/delete/<int:category_id>', methods=['GET'])
@login_required
@dashboard_controller
def item_category_delete(category_id: int):
    try:
        db.session.query(ItemsCategory).filter(ItemsCategory.id == category_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.items', action='success', id=13))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.items', action='warning', id=1))