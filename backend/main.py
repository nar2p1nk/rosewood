from flask import Flask,jsonify,request
import sqlalchemy as db
from dotenv import load_dotenv
import os


# loading the database engine
load_dotenv()

engine = db.create_engine(os.getenv('POSTGRES_ENGINE'))

conn = engine.connect()


app = Flask(__name__)



@app.route('/')
def main():
    return jsonify({'server status':'running'})

@app.route('/users/', methods=['GET'])
def getUsers():

    return jsonify({'users':users})



@app.route('/users/create',methods=['POST'])
def createUser():

    return jsonify({"users":users})

if __name__ == '__main__':
    app.run(debug=True)
