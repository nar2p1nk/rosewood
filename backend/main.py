from flask import Flask, jsonify
from users import users_page
from login import login_page
# Flask app

app = Flask(__name__)

app.register_blueprint(users_page)
app.register_blueprint(login_page)


@app.route('/')
def main():
    return jsonify({'server status': 'running'})


if __name__ == '__main__':
    app.run(debug=True)

