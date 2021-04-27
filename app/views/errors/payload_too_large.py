from flask import render_template

from app.views.main import bp


@bp.errorhandler(413)
def payload_too_large(error):
    print(error)
    return render_template("error/base.html"), 200