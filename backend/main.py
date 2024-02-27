from flask import Flask, request, jsonify
import psycopg2
from dotenv import load_dotenv
import os
import random
from datetime import datetime
# configuring database

load_dotenv()

conn = psycopg2.connect(os.getenv('POSTGRES_ENGINE'))

cur = conn.cursor()

# Flask app

app = Flask(__name__)


@app.route('/')
def main():
    return jsonify({'server status': 'running'})


@app.route('/users/', methods=['GET'])
def getUsers():

    cur.execute('SELECT * FROM users;')

    users = cur.fetchall()

    print(users, 'bruh moment')

    return jsonify({'users': users})

    cur.close()


@app.route('/users/create', methods=['POST'])
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


if __name__ == '__main__':
    app.run(debug=True)

conn.close()
