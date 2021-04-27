from flask import render_template, redirect, url_for

from app import db
from app.controllers.app_controller import app_controller
from app.controllers.qustion_phone import question_phone
from app.models.news import News
from app.models.news_category import NewsCategory
from app.views.main import bp


@bp.route('/new/<int:new_id>', methods=['GET', 'POST'])
@app_controller
@question_phone
def new(new_id: int, **kwargs):
    data = db.session.query(News).filter(News.id == new_id).first()
    if not data or data.status == 0:
        return redirect(url_for('news', category=0))

    db.session.query(News).filter(News.id == new_id).update({'views': data.views + 1})
    db.session.commit()
    kwargs['title'] = data.title
    kwargs['new'] = data
    kwargs['category'] = db.session.query(NewsCategory).filter(NewsCategory.status == 1).order_by(NewsCategory.name).all()
    return render_template("default/new.html", **kwargs)