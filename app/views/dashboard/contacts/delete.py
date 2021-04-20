from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.models.contacts import Contacts
from app.views.dashboard import bp


@bp.route('/contact/delete/<int:contact_id>', methods=['GET'])
@login_required
@dashboard_controller
def contact_delete(contact_id: int):
    try:
        db.session.query(Contacts).filter(Contacts.id == contact_id).delete()
        db.session.commit()
        return redirect(url_for('dashboard.contacts', action='success', id=22))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.contacts', action='error', id=999))