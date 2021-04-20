from flask import session, url_for, redirect
from flask_login import logout_user, login_required

from app.views.dashboard import bp
from app.controllers.dashboard_controller import dashboard_controller


@bp.route('/logout/')
@login_required
@dashboard_controller
def logout():
    session.pop('version', None)
    session.pop('server_name', None)
    session.pop('language', None)
    logout_user()
    session.clear()
    return redirect(url_for('dashboard.login'))