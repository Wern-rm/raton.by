from flask_ckeditor import upload_success, upload_fail

from app.views.dashboard import bp
from flask import request, url_for, send_from_directory, current_app
import os


@bp.route('/files/<path:filename>')
def uploaded_files(filename):
    path = current_app.config['UPLOADED_PATH']
    return send_from_directory(path, filename)


@bp.route('/upload', methods=['POST'])
def upload():
    f = request.files.get('upload')
    extension = f.filename.split('.')[-1].lower()
    if extension not in ['jpg', 'gif', 'png', 'jpeg']:
        return upload_fail(message='Image only!')
    f.save(os.path.join(current_app.config['UPLOADED_PATH'], f.filename))
    url = url_for('uploaded_files', filename=f.filename)
    return upload_success(url=url)
