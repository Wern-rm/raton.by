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

from flask import url_for, current_app
from werkzeug.datastructures import FileStorage
from datetime import datetime
import hashlib

#: This contains basic image types that are viewable from most browsers (.jpg, jpe, .jpeg, .png, .gif, .svg, and .bmp).
IMAGES = ['jpg', 'jpe', 'jpeg' 'png', 'gif', 'svg', 'bmp']

#: This is for structured data files (.csv, .ini, .json, .plist, .xml, .yaml, .yml).
DATA = ['csv', 'ini', 'json', 'plist', 'xml', 'yaml', 'yml']

#: This contains various office document formats (.rtf, .odf, .ods, .pdf, .abw, .doc, .docx, .xls, and .xlsx).
DOCUMENTS = ['rtf', 'odf', 'ods', 'pdf', 'abw', 'doc', 'docx', 'xls', 'xlsx']

ZIP = ['zip']

ALL = IMAGES + DATA + DOCUMENTS + ZIP


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

    def __init__(self, basedir, storage, extensions=None, rename_full=True):
        self.basedir = basedir
        self.storage = storage
        self.extensions = extensions
        self.path = os.path.join(basedir, storage)
        self.rename_full = rename_full

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

    @staticmethod
    def generate_new_name(basename) -> str:
        name, ext = os.path.splitext(basename)
        date = str(datetime.now())
        key = current_app.config.get('SECRET_KEY')
        new_name = hashlib.md5(str(date + key).encode()).hexdigest()
        return '%s%s' % (new_name, ext)

    def save_file(self, file):
        if not isinstance(file, FileStorage):
            raise TypeError("storage must be a werkzeug.FileStorage")

        if not os.path.exists(self.path):
            os.mkdir(self.path)
        filename = lowercase_ext(custom_secure_filename(file.filename))
        if file:
            if self.extension(filename):
                if self.rename_full:
                    filename = self.generate_new_name(filename)
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
        filename = lowercase_ext(custom_secure_filename(file.filename))
        if file:
            if self.extension(filename):
                if self.rename_full:
                    filename = self.generate_new_name(filename)
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


import sys
import os
import re

_windows_device_files = (
    "CON",
    "AUX",
    "COM1",
    "COM2",
    "COM3",
    "COM4",
    "LPT1",
    "LPT2",
    "LPT3",
    "PRN",
    "NUL",
)

_filename_strip_re = re.compile(r"[^A-Za-zа-яА-ЯёЁ0-9_.-]")


def custom_secure_filename(filename: str) -> str:
    if isinstance(filename, str):
        from unicodedata import normalize
        filename = normalize("NFKD", filename)

    for sep in os.path.sep, os.path.altsep:
        if sep:
            filename = filename.replace(sep, " ")
    filename = str(_filename_strip_re.sub("", "_".join(filename.split()))).strip("._")

    if os.name == "nt" and filename and filename.split(".")[0].upper() in _windows_device_files:
        filename = f"_{filename}"
    return filename