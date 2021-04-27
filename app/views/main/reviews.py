from flask import render_template

from app import db
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.reviews import Reviews
from app.views.main import bp


@bp.route('/reviews', methods=['GET', 'POST'])
@app_controller
@question_phone
def reviews(**kwargs):
    kwargs['title'] = 'Отзывы'
    kwargs['reviews'] = db.session.query(Reviews).filter(Reviews.status == 1).order_by(Reviews.id.desc()).all()
    return render_template("default/reviews.html", **kwargs)