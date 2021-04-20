# -*- coding: utf-8 -*-
"""
    Flask Upload Files
    ~~~~~
    :copyright: 2020 Lightning-Digital
    :license: MIT
"""
__author__ = 'WeRn'
__version__ = '1.0.1'


import os

from flask import url_for
from werkzeug.datastructures import FileStorage
from werkzeug.utils import secure_filename

#: This contains basic image types that are viewable from most browsers (.jpg, jpe, .jpeg, .png, .gif, .svg, and .bmp).
IMAGES = ['jpg', 'jpe', 'jpeg' 'png', 'gif', 'svg', 'bmp']

#: This is for structured data files (.csv, .ini, .json, .plist, .xml, .yaml, .yml).
DATA = ['csv', 'ini', 'json', 'plist', 'xml', 'yaml', 'yml']

#: This contains various office document formats (.rtf, .odf, .ods, .pdf, .abw, .doc, .docx, .xls, and .xlsx).
DOCUMENTS = ['rtf', 'odf', 'ods', 'pdf', 'abw', 'doc', 'docx', 'xls', 'xlsx']

ZIP = ['zip']


def lowercase_ext(filename):
    """
    This is a helper used by UploadSet.save to provide lowercase extensions for
    all processed files, to compare with configured extensions in the same
    case.

    :param filename: The filename to ensure has a lowercase extension.
    """
    if '.' in filename:
        main, ext = os.path.splitext(filename)
        return main + ext.lower()
    return filename


class UploadFiles(object):

    def __init__(self, basedir, storage, extensions):
        self.basedir = basedir
        self.storage = storage
        self.extensions = extensions
        self.path = os.path.join(basedir, storage)
        self.set_rename_file = False

    def extension(self, filename):
        return '.' in filename and str(filename.rsplit('.', 1)[1]).lower() in self.extensions

    def rename(self, basename):
        name, ext = os.path.splitext(basename)
        count = 0
        while True:
            count = count + 1
            new_name = '%s_%d%s' % (name, count, ext)
            if not os.path.exists(os.path.join(self.path, new_name)):
                return new_name

    def rename_file(self, basename, datetime, storage_id):
        if self.is_rename_file:
            name, ext = os.path.splitext(basename)
            new_name = '%s_%s%s' % (datetime.strftime("%d.%m.%Y_%H-%M"), storage_id, ext)
            return new_name
        else:
            return basename

    def is_rename_file(self):
        self.set_rename_file = True

    def save_file(self, file, datetime, storage_id):
        if not isinstance(file, FileStorage):
            raise TypeError("storage must be a werkzeug.FileStorage")

        if not os.path.exists(self.path):
            os.mkdir(self.path)
        filename = lowercase_ext(secure_filename(file.filename))
        if file:
            if self.extension(filename):
                if self.is_rename_file:
                    filename = self.rename_file(basename=filename, datetime=datetime, storage_id=storage_id)
                if os.path.exists(os.path.join(self.path, filename)):
                    filename = self.rename(filename)
                target = os.path.join(self.path, filename)
                file.save(target)
                return filename
            else:
                raise TypeError("The file format is not available for download.")
        else:
            raise FileNotFoundError('There is no downloadable file.')

    def save(self, file):
        if not isinstance(file, FileStorage):
            raise TypeError("storage must be a werkzeug.FileStorage")

        if not os.path.exists(self.path):
            os.mkdir(self.path)
        filename = lowercase_ext(secure_filename(file.filename))
        if file:
            if self.extension(filename):
                if os.path.exists(os.path.join(self.path, filename)):
                    filename = self.rename(filename)
                target = os.path.join(self.path, filename)
                file.save(target)
                return filename
            else:
                raise TypeError("The file format is not available for download.")
        else:
            raise FileNotFoundError('There is no downloadable file.')

    def get_url(self, filename):
        """
        Returns the URL value for full interaction with the file via the web
        :param filename:
        :return:
        """
        return url_for(self.storage, filename=filename,  _external=True)

    def generate_url_file(self, http, filename):
        return http + '/' + self.storage + '/' + filename

    def get_path(self, filename):
        """
        Returns a value that is equal to the folder name and file name
        :param filename:
        :return:
        """
        return self.storage + "/" + filename