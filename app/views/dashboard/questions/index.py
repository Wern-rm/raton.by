from flask import render_template
from flask_login import login_required
from flask_paginate import get_page_args

from app import db
from app.controllers.dashboard_controller import dashboard_controller
from app.controllers.pagination import get_pagination
from app.models.questions import Questions
from app.models.electronic_appeal import ElectronicAppeals
from app.views.dashboard import bp
from app.models.items import Items
from app.models.item_application import ItemApplications


@bp.route('/questions', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def questions(**kwargs):
    count = db.session.query(Questions).count()
    count1 = db.session.query(ElectronicAppeals).count()
    count2 = db.session.query(ItemApplications).count()
    page, per_page, offset = get_page_args(page_parameter='page', per_page_parameter='per_page')
    page1, per_page1, offset1 = get_page_args(page_parameter='page', per_page_parameter='per_page')
    page2, per_page2, offset2 = get_page_args(page_parameter='page', per_page_parameter='per_page')
    kwargs['title'] = 'Управление обращениями'
    kwargs['questions'] = db.session.query(Questions).order_by(Questions.id.desc()).limit(per_page).offset(offset).all()
    kwargs['questions1'] = db.session.query(ElectronicAppeals).order_by(ElectronicAppeals.id.desc()).limit(per_page1).offset(offset1).all()
    kwargs['questions2'] = db.session.query(ItemApplications).order_by(ItemApplications.id.desc()).limit(per_page2).offset(offset2).all()
    kwargs['items'] = db.session.query(Items).all()
    kwargs['pagination'] = get_pagination(page=page, per_page=per_page, total=count, record_name='items', format_total=True, format_number=True)
    kwargs['pagination1'] = get_pagination(page=page1, per_page=per_page1, total=count1, record_name='items', format_total=True, format_number=True)
    kwargs['pagination2'] = get_pagination(page=page2, per_page=per_page2, total=count2, record_name='items', format_total=True, format_number=True)
    return render_template("dashboard/questions.html", **kwargs)