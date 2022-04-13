import os
from dotenv import load_dotenv


from flask import Flask, jsonify, abort

import json

import mariadb
import random

from tools.felix_functions import fix_item, fix_mob

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
			database='Muninn')
	except mariadb.Error as e:
		log(f"ERR: Unable to connect to MariaDB: {e}")
		return None
	else:
		return con

@app.route("/")
def first_page():
	nothing = []
	return jsonify(nothing)

@app.route("/Muninn/items/<item>")
def get_item(item):
	item = item.lower()
	item = fix_item(item)

	con = get_connection()
	cur = con.cursor()
	cur.execute("SELECT id, name, description, type, tele, weight, stack, wikiaThumbnail, craftable, wikiaUrl FROM items WHERE name=? OR id=?", (item, item))
	try:
		id_, name, description, type_, tele, weight, stack, wikiaThumbnail, craftable, wikiaUrl = cur.fetchone()
	except:
		item_dict = {'code': 404, 'error': "No Result"}
	else:
		item_dict = {	'name': name, 'id': id_, 'description': description, 'type': type_, 
						'tele': True if bool(tele) else False, 'weight': weight, 'stack': stack,
						'wikiaThumbnail': wikiaThumbnail, 'wikiaUrl': wikiaUrl}
		if type_ == "food":
			cur.execute("SELECT health, stamina, healing, duration FROM food WHERE id=?", (id_,))
			health, stamina, healing, duration = cur.fetchone()
			item_dict['health'] = health
			item_dict['stamina'] = stamina
			item_dict['healing'] = healing
			item_dict['duration'] = duration
	
		if craftable:
			cur.execute("SELECT source, lvl, mats FROM craftable WHERE id=?", (id_,))
			source, lvl, mats = cur.fetchone()
			temp_dict = {'source': source, 'lvl': lvl, 'mats': json.loads(mats)}
			item_dict['craftable'] = temp_dict
		else:
			cur.execute("SELECT source, chance, location FROM dropable WHERE id=?", (id_,))
			sources = []
			for source, chance, location in cur:
				temp_dict = {'source': source, 'chance': chance, 'location': location}
				sources.append(temp_dict)
			item_dict['sources'] = sources

	con.close()
	return jsonify(item_dict)

@app.route("/Muninn/mobs/<mob>")
def get_mob(mob):
	mob = mob.lower()
	mob = fix_mob(mob)

	con = get_connection()
	cur = con.cursor()
	cur.execute("SELECT id, name, faction, biome, health, veryweak, weak, resist, veryresist, immune, stagger, wikiaThumbnail, wikiaUrl FROM mobs WHERE name=? OR id=?",
				(mob, mob))
	try:
		id_, name, faction, biome, health, veryweak, weak, resist, veryresist, immune, stagger, wikiaThumbnail, wikiaUrl = cur.fetchone()
	except:
		mob_dict = {'code': 404, 'error': "No Result"}
	else:
		mob_dict = {	'name': name, 'id': id_, 'faction': faction, 'biome': biome, 'health': health, 
							'veryweak': veryweak, 'weak': weak, 'resist': resist, 'veryresist': veryresist, 'immune': immune,
							'stagger': stagger, 'wikiaThumbnail': wikiaThumbnail, 'wikiaUrl': wikiaUrl}
	
	con.close()
	return jsonify(mob_dict)

			
if __name__ == "__main__":
	Flask.run(app)