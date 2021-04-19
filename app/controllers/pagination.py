from flask_paginate import Pagination
from flask import current_app


def get_pagination(**kwargs):
    kwargs.setdefault('record_name', 'records')
    return Pagination(css_framework=current_app.config.get('CSS_FRAMEWORK'),
                      link_size=current_app.config.get('LINK_SIZE'),
                      alignment=current_app.config.get('LINK_ALIGNMENT'),
                      show_single_page=current_app.config.get('SHOW_SINGLE_PAGE'),
                      **kwargs)