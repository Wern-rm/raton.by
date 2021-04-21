from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.item_application import ItemApplications
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/question/items/activated/<int:question_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def question_items_activated(question_id: int, status: int):
    try:
        db.session.query(ItemApplications).filter(ItemApplications.id == question_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.questions', action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.questions', action='error', id=999))