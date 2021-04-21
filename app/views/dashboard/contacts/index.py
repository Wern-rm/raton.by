from flask import render_template, redirect, url_for, request
from flask_login import login_required
from flask_paginate import get_page_args

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.controllers.pagination import get_pagination
from app.forms.dashboard_contacts import ContactsForm
from app.models.contacts import Contacts
from app.views.dashboard import bp


@bp.route('/contacts', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def contacts(**kwargs):
    count = db.session.query(Contacts).count()
    page, per_page, offset = get_page_args(page_parameter='page', per_page_parameter='per_page')

    form = ContactsForm()
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            found = db.session.query(Contacts).filter(Contacts.departament == form.departament.data).first()
            if not found:
                new = Contacts(departament=form.departament.data,
                               boss=form.boss.data,
                               phone=form.phone.data,
                               fax=form.fax.data,
                               email=form.email.data,
                               displaying_boss=form.displaying_boss.data,
                               displaying_phone=form.displaying_phone.data,
                               displaying_fax=form.displaying_fax.data,
                               displaying_email=form.displaying_email.data)
                db.session.add(new)
                db.session.commit()
                return redirect(url_for('dashboard.contacts', action='success', id=8))
            else:
                return redirect(url_for('dashboard.contacts', action='error', id=6))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.contacts', action='warning', id=1))

    form_edit = ContactsForm()
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            contact_id = int(request.form['contact-id'])
            found = db.session.query(Contacts).filter(Contacts.departament == form_edit.departament.data, Contacts.id != contact_id).first()
            if not found:
                db.session.query(Contacts).filter(Contacts.id == contact_id).update({
                    'departament': form_edit.departament.data,
                    'boss': form_edit.boss.data,
                    'phone': form_edit.phone.data,
                    'fax': form_edit.fax.data,
                    'email': form_edit.email.data,
                    'displaying_boss': form_edit.displaying_boss.data,
                    'displaying_phone': form_edit.displaying_phone.data,
                    'displaying_fax': form_edit.displaying_fax.data,
                    'displaying_email': form_edit.displaying_email.data
                })
                db.session.commit()
                return redirect(url_for('dashboard.contacts', action='success', id=9))
            else:
                return redirect(url_for('dashboard.contacts', action='error', id=6))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.contacts', action='warning', id=1))

    kwargs['title'] = 'Управление контактами'
    kwargs['counts'] = count
    kwargs['page'] = page
    kwargs['per_page'] = per_page
    kwargs['offset'] = offset
    kwargs['clients'] = db.session.query(Contacts).order_by(Contacts.id).limit(per_page).offset(offset).all()
    kwargs['pagination'] = get_pagination(page=page, per_page=per_page, total=count, record_name='items', format_total=True, format_number=True)
    kwargs['form'] = form
    kwargs['form_edit'] = form_edit
    return render_template("dashboard/contacts.html", **kwargs)