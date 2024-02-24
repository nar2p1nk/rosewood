from flask import Flask,jsonify,request
import os
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase


app = Flask(__name__)

users = ['placeholder]']

# initialize flask-sqlalchemy


class Base(DeclarativeBase):
    pass


db = SQLAlchemy(model_class=Base)

app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('POSTGRES_ENGINE')


@app.route('/')
def main():
    return jsonify({'server status': 'running'})


@app.route('/users/', methods=['GET'])
def getUsers():

    return jsonify({'users': users})


@app.route('/users/create', methods=['POST'])
def createUser():

    return jsonify({"users": users})


if __name__ == '__main__':
    app.run(debug=True)
