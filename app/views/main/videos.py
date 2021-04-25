from flask import render_template

from app import db
from app.controllers.app_controller import app_controller
from app.models.videos import Videos
from app.views.main import bp


@bp.route('/videos')
@app_controller
def videos(**kwargs):
    kwargs['title'] = 'Видео материалы'
    kwargs['videos'] = db.session.query(Videos).filter(Videos.status == 1).order_by(Videos.id.desc()).all()
    return render_template("default/videos.html", **kwargs)