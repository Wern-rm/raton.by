from flask import Blueprint

bp = Blueprint('main', __name__)

from app.views.main.index import index, yandex_verifications
from app.views.main.items import items
from app.views.main.item import item
from app.views.main.contacts import contacts
from app.views.main.page import page
from app.views.main.electrinic_appeal import electronic_appeal
from app.views.main.videos import videos
from app.views.main.photos import photos
from app.views.main.staff import staff
from app.views.main.docs import docs