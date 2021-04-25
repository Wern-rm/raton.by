from flask import render_template, redirect, url_for, request, current_app

from app import db, logger
from app.controllers.app_controller import app_controller
from app.forms.main_electron_appeal import Form1ElectronAppeal, Form2ElectronAppeal
from app.models.electronic_appeal import ElectronicAppeals
from app.utils.flask_upload_files import UploadFiles
from app.views.main import bp

RATON_FILES_EXTENSIONS = ['doc', 'docx', 'pdf', 'jpg', 'png', 'txt']


@bp.route('/electronic-appeal', methods=['GET', 'POST'])
@app_controller
def electronic_appeal(**kwargs):

    form1 = Form1ElectronAppeal()
    if form1.validate_on_submit() and request.form['form-id'] == '1':
        try:
            file_url = None
            if form1.file.data is not None:
                uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='user_uploads', extensions=RATON_FILES_EXTENSIONS)
                filename = uploader.save(file=form1.file.data)
                file_url = uploader.get_path(filename=filename)
            new = ElectronicAppeals(username=form1.fio.data,
                                    address=form1.address.data,
                                    email=form1.email.data,
                                    message=form1.message.data,
                                    file=file_url,
                                    type=1)
            db.session.add(new)
            db.session.commit()
            return redirect(url_for('main.electronic_appeal', action='success', id=123))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('main.electronic_appeal', action='warning', id=123))

    form2 = Form2ElectronAppeal()
    if form2.validate_on_submit() and request.form['form-id'] == '2':
        try:
            file_url = None
            if form2.file.data is not None:
                uploader = UploadFiles(basedir=current_app.config.get('STATIC_APP'), storage='user_uploads', extensions=RATON_FILES_EXTENSIONS)
                filename = uploader.save(file=form2.file.data)
                file_url = uploader.get_path(filename=filename)
            new = ElectronicAppeals(username=form2.name.data + " " + form2.fio.data,
                                    address=form2.address.data,
                                    email=form2.email.data,
                                    message=form2.message.data,
                                    file=file_url,
                                    type=2)
            db.session.add(new)
            db.session.commit()
            return redirect(url_for('main.electronic_appeal', action='success', id=123))
        except Exception as e:
            db.session.rollback()
            logger.error(e)
            return redirect(url_for('main.electronic_appeal', action='warning', id=123))

    kwargs['title'] = 'Электронное обращение'
    kwargs['form1'] = form1
    kwargs['form2'] = form2
    return render_template("default/electronic_appeal.html", **kwargs)


# MAX_FILE_SIZE = 3 * 1024 * 1024 + 1
# file = form1.file.data
# file_bytes = form1.file.data.read(MAX_FILE_SIZE)
# if len(file_bytes) >= MAX_FILE_SIZE:
#     return redirect(url_for('main.electronic_appeal', action='error', id=1231))
# photo_size = os.stat(form1.file.data).st_size
# print(photo_size)