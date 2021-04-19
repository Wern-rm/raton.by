from flask import render_template
from flask_login import login_required

from app import db
from app.controllers.dashboard_controller import dashboard_controller
from app.models.accounts import Users
from app.views.dashboard import bp


@bp.route('/index')
@login_required
@dashboard_controller
def index(**kwargs):
    kwargs['title'] = 'Главная'
    kwargs['user_count'] = db.session.query(Users).count()
    return render_template("dashboard/index.html", **kwargs)