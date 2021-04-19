from threading import Thread
from flask import current_app, render_template
from flask_mail import Message
from app import mail_controller


def send_async_email(app, msg):
    with app.app_context():
        mail_controller.send(msg)


def send_email(subject, sender, recipients, text_body, html_body, attachments=None, sync=False):
    msg = Message(subject, sender=sender, recipients=recipients)
    msg.body = text_body
    msg.html = html_body
    if attachments:
        for attachment in attachments:
            msg.attach(*attachment)
    if sync:
        mail_controller.send(msg)
    else:
        thread = Thread(target=send_async_email, args=(current_app._get_current_object(), msg))
        thread.start()


def send_recovery(email, new_password):
    send_email('[crossapi.ru] Восстановление аккаунта',
               sender='no-reply@crossapi.ru',
               recipients=[email],
               text_body=render_template('mail/recovery_password.v2.txt', new_password=new_password),
               html_body=render_template('mail/recovery_password.v2.html', new_password=new_password))


def send_signup_mail(email, token):
    send_email('[crossapi.ru] Подтверждение регистрации',
               sender='no-reply@crossapi.ru',
               recipients=[email],
               text_body=render_template('mail/send_signup.v2.txt', token=token),
               html_body=render_template('mail/send_signup.v2.html', token=token))


def send_remind2pay_mail(email, name, date, key, api_name, api_description):
    send_email('[crossapi.ru] Продление API',
               sender='no-reply@crossapi.ru',
               recipients=[email],
               text_body=render_template('mail/remind2pay.v2.txt', name=name, date=date, key=key, api_name=api_name, api_description=api_description),
               html_body=render_template('mail/remind2pay.v2.html', name=name, date=date, key=key, api_name=api_name, api_description=api_description))


def send_pay_url_mail(email, name, api_name, api_id, url_pay):
    send_email('[crossapi.ru] Ссылка на оплату API',
               sender='no-reply@crossapi.ru',
               recipients=[email],
               text_body=render_template('mail/pay_url.txt', name=name, api_name=api_name, api_id=api_id, url_pay=url_pay),
               html_body=render_template('mail/pay_url.html', name=name, api_name=api_name, api_id=api_id, url_pay=url_pay))