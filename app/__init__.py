import locale
import logging

from flask import Flask, Request
from flask_login import LoginManager
from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
from flask_ckeditor import CKEditor

from config import Config

logger = logging.getLogger()
db = SQLAlchemy()
mail_controller = Mail()
login = LoginManager()
editor = CKEditor()

login.login_view = 'dashboard.login'


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    locale.setlocale(locale.LC_ALL, '')

    db.init_app(app)
    login.init_app(app)
    mail_controller.init_app(app)
    editor.init_app(app)

    from app.views.main import bp
    app.register_blueprint(bp)

    from app.views.dashboard import bp as dash_bp
    app.register_blueprint(dash_bp, url_prefix='/dashboard')

    from app.models.settings import Settings
    with app.app_context():
        print('Load new config settings: ')
        for s in db.session.query(Settings).all():
            print(s.key, '=', s.value)
            if s.type == 'bool' and s.value == 'True':
                app.config[str(s.key)] = True
            elif s.type == 'bool' and s.value == 'False':
                app.config[str(s.key)] = False
            elif s.type == 'int':
                app.config[str(s.key)] = int(s.value)
            elif s.type == 'string':
                app.config[str(s.key)] = str(s.value)

    app.request_class = CustomRequest

    return app


class CustomRequest(Request):
    @property
    def max_content_length(self):
        if self.path.startswith("/electronic-appeal"):
            return 3 * 1024 * 1024
        else:
            return super().max_content_length

