from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.accounts import Users
from app.views.dashboard import bp


@bp.route('/user/banned/<int:user_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def user_banned(user_id: int, status: int, **kwargs):
    try:
        db.session.query(Users).filter(Users.id == user_id).update({'is_banned': status})
        db.session.commit()
        return redirect(url_for('dashboard.users', action='success', id=11))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.users', action='error', id=999))
