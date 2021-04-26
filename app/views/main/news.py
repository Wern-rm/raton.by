from flask import render_template, request, redirect, url_for

from app import db, logger
from app.controllers.app_controller import app_controller
from app.models.news_category import NewsCategory
from app.models.news import News
from app.views.main import bp


@bp.route('/news')
@app_controller
def news(**kwargs):
    category_id = 0
    try:
        if request.args.get('category_id') is not None and request.args.get('category_id') != '':
            category_id = int(request.args.get('category_id'))
    except Exception as e:
        logger.error(e)
        return redirect(url_for('main.news', category_id=0))

    if category_id == 0:
        kwargs['news'] = db.session.query(News).filter(News.status == 1).all()
    else:
        kwargs['news'] = db.session.query(News).filter(News.category_id == category_id, News.status == 1).all()

    kwargs['title'] = 'Публикации'
    kwargs['category_id'] = category_id
    kwargs['category'] = db.session.query(NewsCategory).filter(NewsCategory.status == 1).order_by(NewsCategory.name).all()
    return render_template("default/news.html", **kwargs)