from flask import Flask,jsonify,request
from dotenv import load_dotenv
import os
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase

app = Flask(__name__)

# load secrets

load_dotenv()

databaseUri = os.getenv('POSTGRES_ENGINE')

# initialize flask-sqlalchemy


class Base(DeclarativeBase):
    pass


db = SQLAlchemy(model_class=Base)


app.config['SQLALCHEMY_DATABASE_URI'] = databaseUri

db.init_app(app)

metadata = db.MetaData()


@app.route('/')
def main():
    return jsonify({'server status': 'running'})


@app.route('/users/', methods=['GET'])
def getUsers():

    users = db.Table('users', metadata)

    print(users, 'bruh moment')

    return jsonify({'users': users.columns.keys()})


@app.route('/users/create', methods=['POST'])
def createUser():

    users = db.Table('users', metadata)

    return jsonify({"users": users.columns.keys()})


if __name__ == '__main__':
    app.run(debug=True)
