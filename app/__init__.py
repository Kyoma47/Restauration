from flask import Flask

app = Flask(__name__)

from app.views import client_views
from app.views import admin_views
