from flask import redirect, url_for
from flask_login import login_required

from app import db, logger
from app.models.item_files import ItemFiles
from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/item/file/activated/<int:item_id>/<int:file_id>/<int:status>', methods=['GET'])
@login_required
@dashboard_controller
def item_file_activated(item_id: int, file_id: int, status: int):
    try:
        db.session.query(ItemFiles).filter(ItemFiles.id == file_id).update({'status': status})
        db.session.commit()
        return redirect(url_for('dashboard.item', item_id=item_id, action='success', id=23))
    except Exception as e:
        db.session.rollback()
        logger.error(e)
        return redirect(url_for('dashboard.item', item_id=item_id, action='error', id=999))