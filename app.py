import os

from dotenv import find_dotenv, load_dotenv
from flask import Flask

app = Flask(__name__)


@app.route('/index')
def index():
    return f"you set the env var FOO to: {os.getenv('FOO')}"
