from flask import Blueprint

bp = Blueprint('dashboard', __name__)


from app.views.dashboard.login import login
from app.views.dashboard.index import index
from app.views.dashboard.setting import settings
from app.views.dashboard.logout import logout
from app.views.dashboard.users import *
from app.views.dashboard.sliders import *
from app.views.dashboard.leadership import *
from app.views.dashboard.clients import *
from app.views.dashboard.reviews import *
from app.views.dashboard.contacts import *
from app.views.dashboard.questions import *
from app.views.dashboard.media import *
from app.views.dashboard.pages import *
from app.views.dashboard.news import *