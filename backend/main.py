import os

from flask import Flask, render_template
from flask_session import Session

app = Flask(__name__, template_folder="../frontend/templates")

app.static_folder = '../frontend/src'
app.static_url_path = '/static'

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

app.config['SECRET_KEY'] = os.environ.get("SECRET_KEY", "dev-secret")
app.config['SESSION_TYPE'] = 'filesystem'

app.config.update(
    SESSION_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE='Lax',
    SESSION_COOKIE_SECURE=True
)

Session(app)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)