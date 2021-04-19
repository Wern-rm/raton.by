from flask import render_template
from app.views.main import bp
from app.controllers.app_controller import app_controller


@bp.route('/')
@app_controller
def index(**kwargs):
    kwargs['title'] = 'Главная'
    return render_template("default/index.html", **kwargs)


@bp.route('/yandex_4770903cc86d8d80.html')
def yandex_verifications():

    return """
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            </head>
            <body>Verification: 4770903cc86d8d80</body>
        </html>
    """
