from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.accounts import Users
from app.views.dashboard import bp


@bp.route('/user/delete/<int:user_id>', methods=['GET'])
@login_required
@dashboard_controller
def user_delete(user_id: int, **kwargs):
    try:
        db.session.query(Users).filter(Users.id == user_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.users', action='success', id=64))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.users', action='warning', id=1))