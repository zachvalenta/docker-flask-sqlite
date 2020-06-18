import os

from flask import Flask

app = Flask(__name__)


@app.route('/index')
def index():
    return f"you set the env var FOO to: {os.getenv('FOO')}"
