from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.files import Files
from app.views.dashboard import bp


@bp.route('/file/delete/<int:file_id>', methods=['GET'])
@login_required
@dashboard_controller
def file_delete(file_id: int):
    try:
        db.session.query(Files).filter(Files.id == file_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.files', action='success', id=50))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.files', action='warning', id=1))