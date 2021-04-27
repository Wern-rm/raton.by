import os

from flask import render_template, redirect, url_for, request, current_app
from flask_login import login_required

from app import db, logger
from app.controllers.dashboard_controller import dashboard_controller
from app.forms.dashboard_shops import ShopsForm, ShopsMapForm
from app.models.shops import Shops
from app.views.dashboard import bp
from app.models.settings import Settings


@bp.route('/shops', methods=['GET', 'POST'])
@login_required
@dashboard_controller
def shops(**kwargs):
    form = ShopsForm()
    if form.validate_on_submit() and request.form['form-id'] == '1':
        try:
            found = db.session.query(Shops).filter(Shops.name == form.name.data).first()
            if not found:
                new = Shops(name=form.name.data,
                            type=form.type.data,
                            address=form.address.data,
                            phone=form.phone.data,
                            site=form.site.data,
                            email=form.email.data)
                db.session.add(new)
                db.session.commit()
                return redirect(url_for('dashboard.shops', action='success', id=21216))
            else:
                return redirect(url_for('dashboard.shops', action='error', id=4234))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.shops', action='warning', id=1))

    form_edit = ShopsForm()
    if form_edit.validate_on_submit() and request.form['form-id'] == '2':
        try:
            shop_id = int(request.form['shop-id'])
            found = db.session.query(Shops).filter(Shops.name == form_edit.name.data, Shops.id != shop_id).first()
            if not found:
                db.session.query(Shops).filter(Shops.id == shop_id).update({
                    'name': form_edit.name.data,
                    'type': form_edit.type.data,
                    'address': form_edit.address.data,
                    'phone': form_edit.phone.data,
                    'email': form_edit.email.data,
                    'site': form_edit.site.data
                })
                db.session.commit()
                return redirect(url_for('dashboard.shops', action='success', id=234243))
            else:
                return redirect(url_for('dashboard.shops', action='error', id=23424))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.shops', action='warning', id=1))


    form_map = ShopsMapForm()
    if form_map.validate_on_submit() and request.form['form-id'] == '3':
        try:
            db.session.query(Settings).filter(Settings.key == 'TNP_MAP').update({'value': str(form_map.tnp.data)})
            db.session.query(Settings).filter(Settings.key == 'ELECTRO_MAP').update({'value': str(form_map.electro.data)})
            current_app.config.update(TNP_MAP=str(form_map.electro.data), ELECTRO_MAP=str(form_map.tnp.data))
            return redirect(url_for('dashboard.shops', action='success', id=234243))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('dashboard.shops', action='warning', id=1))

    kwargs['title'] = 'Управление руководителями'
    kwargs['TNP_MAP'] = current_app.config.get('TNP_MAP')
    kwargs['ELECTRO_MAP'] = current_app.config.get('ELECTRO_MAP')
    kwargs['data'] = db.session.query(Shops).order_by(Shops.id).all()
    kwargs['form'] = form
    kwargs['form_edit'] = form_edit
    kwargs['form_map'] = form_map
    return render_template("dashboard/shops.html", **kwargs)