from flask import Blueprint, request, jsonify
import random
import bcrypt
from datetime import datetime
from database import conn, cur

users_page = Blueprint('users_page', __name__)


@users_page.route('/users/', methods=['GET'])
def getUsers():

    cur.execute('SELECT * FROM users;')

    users = cur.fetchall()

    print(users, 'bruh moment')

    return ({'users': users})

    cur.close()


@users_page.route('/users/create', methods=['POST'])
def createUser():

    # defining data
    user = request.json['user']

    id = random.randint(0000000000, 99999999999)

    emailAddress = user['emailAddress']

    username = user['username']

    password = user['password']

    firstName = user['firstName']

    lastName = user['lastName']

    # validating data

    #   username

    if username == '':
        return ({"error": "username field is empty"})

    if len(username) < 8:
        return jsonify({"error": 'username must be 8 characters long'})

    #   password

    if password == '':
        return ({"error": "password field is empty"})

    if len(password) < 8:
        return ({"error": 'password must be 8 characters long'})

    #   emailAddress

    if emailAddress == '':
        return ({"error": "email field is empty"})

    # hashing password

    passwordBytes = password.encode('utf-8')

    salt = bcrypt.gensalt(10)

    passwordHash = bcrypt.hashpw(passwordBytes, salt)

    # inserting data into database query
    cur.execute('''
                INSERT INTO users
                (user_id,email_address,username,
                first_name,last_name,password,
                actived,signup_date)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
                ''', (str(id),
                      emailAddress,
                      username,
                      firstName, lastName,
                      passwordHash,
                      False,
                      datetime.now(),
                      ))

    conn.commit()

    cur.execute(
        'SELECT * FROM users WHERE username = (%s)',
        (user['username'],))

    returnUser = cur.fetchone()

    print(len(returnUser[2]))

    return jsonify({"user created": returnUser})

    cur.close()
    conn.close()
