import os
from dotenv

from flask import Flask, jsonify

import random

app = Flask(__name__)

def get_connection():
	try:
		con = mariadb.connect(
			user=USER,
			password=PWD,
			host='localhost',
			port=3306,
			database='ffxiv',
			autocommit=True)
	except mariadb.Error as e:
		log(f"ERR: Unable to connect to MariaDB: {e}")
		return None
	else:
		return con

@app.route("/")
def hello_world():
	return "<p>Hello World!<p>"

@app.route("/json/")
def send_json():
	json = [{'name': "Eltimablo", 'censoredForGit': "True"},
			{'name': "Sylvan", 'censoredForGit': "True" if bool(random.getrandbits(1)) else "False"},
			{'name': "Quailow", 'censoredForGit': None},
			{'name': "Ruri", 'censoredForGit': "False"}]
	return jsonify(json)
			