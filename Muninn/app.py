import os
from dotenv import load_dotenv

from flask import Flask, jsonify

import mariadb
import random

load_dotenv()
USER=os.getenv("USER")
PWD=os.getenv("PASSWORD")

app = Flask(__name__)

def get_connection():
	try:
		con = mariadb.connect(
			user=USER,
			password=PWD,
			host='localhost',
			port=3306,
			database='Muninn',
			autocommit=True)
	except mariadb.Error as e:
		log(f"ERR: Unable to connect to MariaDB: {e}")
		return None
	else:
		return con

@app.route("/")
def first_page():
	return jsonify("{}")

@app.route("/json/")
def send_json():
	json = [{'name': "Eltimablo", 'censoredForGit': "True"},
			{'name': "Sylvan", 'censoredForGit': "True" if bool(random.getrandbits(1)) else "False"},
			{'name': "Quailow", 'censoredForGit': None},
			{'name': "Ruri", 'censoredForGit': "False"}]
	return jsonify(json)
			