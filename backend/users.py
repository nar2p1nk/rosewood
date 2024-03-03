from flask import Blueprint, request, jsonify
import random
from datetime import datetime
from database import conn, cur
users_page = Blueprint('users_page', __name__)


@users_page.route('/users/', methods=['GET'])
def getUsers():

    cur.execute('SELECT * FROM users;')

    users = cur.fetchall()

    print(users, 'bruh moment')

    return jsonify({'users': users})

    cur.close()


@users_page.route('/usersFile')
def createUser():

    # defining data
    data = request.json

    id = random.randint(0000000000, 99999999999)

    emailAddress = data['emailAddress']

    username = data['username']

    password = data['password']

    cur.execute('''
                INSERT INTO users
                (user_id,email_address,username,
                first_name,last_name,password,
                actived,signup_date)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
                ''', (str(id),
                      emailAddress,
                      username,
                      '', '',
                      password,
                      False,
                      datetime.now(),
                      ))

    cur.execute(
        'SELECT * FROM users WHERE username = (%s)',
        (data['username'],))

    returnUser = cur.fetchone()

    print(len(returnUser[2]))

    return jsonify({"user created": returnUser})
