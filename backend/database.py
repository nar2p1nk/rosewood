import psycopg2
from dotenv import load_dotenv
import os
# configuring database

load_dotenv()

conn = psycopg2.connect(os.getenv('POSTGRES_ENGINE'))

cur = conn.cursor()
