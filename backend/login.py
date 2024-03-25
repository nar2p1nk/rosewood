from flask import Blueprint, request, jsonify
from flask_login import LoginManager
from email_validator import validate_email, EmailNotValidError
from database import conn, cur
import bcrypt

login_manager = LoginManager()

login_page = Blueprint('login_page', __name__)

login_manager.init_app(login_page)


@login_page.route('/login/', methods=['POST'])
def userLogin():

    # validating data
    userData = request.json['user']

    # username
    username = userData['username']

    if username == '':
        return jsonify({'error': 'username not written'})

    print(username)

    # authenticate user

    #   finding user by username
    cur.execute('SELECT * FROM users WHERE username = (%s)', (username,))

    user = cur.fetchone()

    if user is None:
        return ({'error': 'there are no user by that username'})

    #   verifying password

    hashedPassword = user[5]

    dataPassword = userData['password']

    result = bcrypt.checkpw(dataPassword.encode('utf-8'),
                            hashedPassword.encode('utf-8'))

    return ({"password": result})
