import os

from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

# construct path to SQLite file
basedir = os.path.abspath(os.path.dirname(__file__))
db_path = os.path.join(basedir, os.getenv("SQLITE_FILE"))
db_uri = "sqlite:///" + db_path

# init and config app, init db
app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)

# declare model
class Thing(db.Model):
    pk = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30))

    def __repr__(self):
        return f"id {self.pk} name {self.name}"


# create tables on app start
db.create_all()


@app.route('/healthcheck')
def index():
    return "app runnning", 200
