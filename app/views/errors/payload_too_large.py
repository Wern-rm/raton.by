from flask import redirect, url_for

from app.views.main import bp


@bp.errorhandler(413)
def payload_too_large(error):
    return error
# redirect(url_for('main.index', action='warning', id=2, error=error)), 200