from flask import render_template
from flask_login import login_required

from app import db
from app.controllers.dashboard_controller import dashboard_controller
from app.models.accounts import Users
from app.models.items import Items
from app.views.dashboard import bp
from app.models.item_application import ItemApplications
from app.models.electronic_appeal import ElectronicAppeals
from app.models.news import News
from app.models.news_category import NewsCategory


@bp.route('/')
@login_required
@dashboard_controller
def index(**kwargs):
    kwargs['title'] = 'Главная'
    kwargs['user_count'] = db.session.query(Users).count()
    kwargs['items_count'] = db.session.query(Items).count()
    kwargs['item_applications_count'] = db.session.query(ItemApplications).filter(ItemApplications.status == 0).count()
    kwargs['electron_questions_count'] = db.session.query(ElectronicAppeals).filter(ElectronicAppeals.status == 0).count()

    kwargs['news'] = db.session.query(News).order_by(News.id.desc()).limit(10)
    kwargs['news_category'] = db.session.query(NewsCategory).all()
    kwargs['item_applications'] = db.session.query(ItemApplications).order_by(ItemApplications.id.desc()).limit(10)

    return render_template("dashboard/index.html", **kwargs)