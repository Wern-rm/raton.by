from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.news import News
from app.models.news_category import NewsCategory
from app.views.dashboard import bp


@bp.route('/new/category/delete/<int:category_id>', methods=['GET'])
@login_required
@dashboard_controller
def new_category_delete(category_id: int):
    try:
        count = db.session.query(News).filter(News.category_id == category_id).count()
        if count != 0:
            return redirect(url_for('dashboard.news', action='error', id=22))
        db.session.query(NewsCategory).filter(NewsCategory.id == category_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.news', action='success', id=22))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.news', action='error', id=999))