def fix_item(item):
	if "shrooms" in item:
		item = item.replace("shrooms", "shroom")
	elif "berry" in item:
		item = item.replace("berry", "berries")

	return item

def fix_mob(mob):
	if mob == "elder":
		mob = "the elder"
	elif mob == "modor":
		mob = "moder"
	elif mob == "lich" or mob == "goblin king":
		mob = "yagluth"
	
	return mob