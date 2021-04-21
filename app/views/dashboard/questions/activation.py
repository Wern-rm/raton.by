from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.questions import Questions
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/question/activated/<int:question_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def question_activated(question_id: int, status: int):
    try:
        db.session.query(Questions).filter(Questions.id == question_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.questions', action='success', id=53))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.questions', action='warning', id=1))