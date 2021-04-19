# -*- coding: utf-8 -*-
__author__ = 'WeRn'

import platform
from flask import request


def get_ip_address():
    if platform.system() == 'Windows':
        ip = request.environ['REMOTE_ADDR']
    else:
        ip = request.headers.get('X-Real-IP')
    return ip