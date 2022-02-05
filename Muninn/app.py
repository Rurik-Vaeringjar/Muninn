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
	nothing = []
	return jsonify(nothing)

@app.route("/json/")
def send_json():
	json = [{'name': "Eltimablo", 'censoredForGit': "True"},
			{'name': "Sylvan", 'censoredForGit': "True" if bool(random.getrandbits(1)) else "False"},
			{'name': "Quailow", 'censoredForGit': None},
			{'name': "Ruri", 'censoredForGit': "False"}]
	return jsonify(json)

@app.route("/items/<item>")
def get_item(item):
	con = get_connection()
	cur = con.cursor()
	cur.execute("SELECT id, name, description, type, tele, weight, stack, wikiaThumbnail FROM items WHERE name=?", (item,))
	id_, name, description, type_, tele, weight, stack, wikiaThumbnail = cur.fetchone()
	item_dict = {	'name': name, 'id': id_, 'description': description, 'type': type_, 
					'tele': True if bool(tele) else False, 'weight': weight, 'stack': stack,
					'wikiaThumbnail': wikiaThumbnail}
	if type_ == "food":
		cur.execute("SELECT health, stamina, healing, duration FROM food WHERE id=?", (id_,))
		health, stamina, healing, duration = cur.fetchone()
		item_dict['health'] = health
		item_dict['stamina'] = stamina
		item_dict['healing'] = f"{healing}/tick"
		item_dict['duration'] = f"{duration}s"
	return jsonify(item_dict)
			
if __name__ == "__main__":
	Flask.run(app)