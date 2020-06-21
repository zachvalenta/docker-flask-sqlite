import os

from flask import Flask

app = Flask(__name__)


@app.route('/index')
@app.route('/healthcheck')
def index():
    return f"you set the env var FOO to: {os.getenv('FOO')}"
    return "app runnning", 200
