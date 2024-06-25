extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	savedData_load()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



#saved properties (overworld):
var saved_position = Vector2(0, 0) # [saved overworld player position, to be applied when loading back into any of the overworld-type levels ("areas")]
var saved_score = 0 # [saved overworld score, to be restored when loading back into any of the overworld-type levels]
var saved_last_area_filePath = "res://Levels/empty.tscn"

#unlocked weapons
var saved_weapon_basic = -1 # [0 if the weapon type was found in the world, making it available for purchase, 1 if purchased, making it permanently selectable using quickselect.]
var saved_weapon_veryFast_speed = -1
var saved_weapon_ice = -1
var saved_weapon_fire = -1
var saved_weapon_destructive_fast_speed = -1
var saved_weapon_short_shotDelay = -1
var saved_weapon_phaser = -1
var saved_secondaryWeapon_basic = -1
var saved_secondaryWeapon_fast = -1

func savedData_save(save_player_position):
	if save_player_position:
		saved_position = $/root/World.player.position
	
	saved_score = Globals.level_score
	
	#save item unlock states
	save_item_unlock_state("weapon_basic")
	save_item_unlock_state("weapon_veryFast_speed")
	save_item_unlock_state("weapon_ice")
	save_item_unlock_state("weapon_fire")
	save_item_unlock_state("weapon_destructive_fast_speed")
	save_item_unlock_state("weapon_short_shotDelay")
	save_item_unlock_state("weapon_phaser")
	save_item_unlock_state("secondaryWeapon_basic")
	save_item_unlock_state("secondaryWeapon_fast")
	
	savedData_save_file()


var item_unlock_state
func save_item_unlock_state(item):
	item_unlock_state = $/root/World/HUD/quickselect_screen.get("unlock_state_" + item)
	set("saved_" + item, item_unlock_state)

func savedData_save_file():
	var savedData_file = FileAccess.open("user://savedData.save", FileAccess.WRITE)
	var savedData_data = call("savedData_save_dictionary")
	
	var json_string = JSON.stringify(savedData_data)
	
	# Store the save dictionary as a new line in the save file.
	savedData_file.store_line(json_string)
	


func savedData_load():
	if not FileAccess.file_exists("user://savedData.save"):
		print("Couldn't find the save file (savedData - All of the overworld progress).")
		return # Error! We don't have a save to load.
		
	var savedData_file = FileAccess.open("user://savedData.save", FileAccess.READ)
	while savedData_file.get_position() < savedData_file.get_length():
		var json_string = savedData_file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
			
		var data = json.get_data()
		
		#LOAD SAVED PROPERTIES
		
		saved_position = data["saved_position"]
		saved_score = data["saved_score"]
		saved_last_area_filePath = data["saved_last_area_filePath"]
		saved_weapon_basic = data["saved_weapon_basic"]
		saved_weapon_veryFast_speed = data["saved_weapon_veryFast_speed"]
		saved_weapon_ice = data["saved_weapon_ice"]
		saved_weapon_fire = data["saved_weapon_fire"]
		saved_weapon_destructive_fast_speed = data["saved_weapon_destructive_fast_speed"]
		saved_weapon_short_shotDelay = data["saved_weapon_short_shotDelay"]
		saved_weapon_phaser = data["saved_weapon_phaser"]
		saved_secondaryWeapon_basic = data["saved_secondaryWeapon_basic"]
		saved_secondaryWeapon_fast = data["saved_secondaryWeapon_fast"]
		
		#saved_propertyName = data["saved_propertyName"]
		
		#LOAD SAVED PROPERTIES END



#SAVE START

func savedData_save_dictionary():
	var save_dict = {
		#saved properties
		"saved_position" : saved_position,
		"saved_score" : saved_score,
		"saved_last_area_filePath" : saved_last_area_filePath,
		"saved_weapon_basic" : saved_weapon_basic,
		"saved_weapon_veryFast_speed" : saved_weapon_veryFast_speed,
		"saved_weapon_ice" : saved_weapon_ice,
		"saved_weapon_fire" : saved_weapon_fire,
		"saved_weapon_destructive_fast_speed" : saved_weapon_destructive_fast_speed,
		"saved_weapon_short_shotDelay" : saved_weapon_short_shotDelay,
		"saved_weapon_phaser" : saved_weapon_phaser,
		"saved_secondaryWeapon_basic" : saved_secondaryWeapon_basic,
		"saved_secondaryWeapon_fast" : saved_secondaryWeapon_fast,
		
		#"saved_propertyName" : saved_propertyName,
	
	}
	return save_dict

#SAVE END