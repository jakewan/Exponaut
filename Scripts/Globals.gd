extends Node


#variables

var direction = 1

var level_score = 0
var combo_score = 0
var combo_tier = 1
var collected_in_cycle = 0

var total_score = 0


var playerHP
var player_posX
var player_posY



#signals

signal apple_collected
signal carrot_collected
signal cheese_collected
signal jewelGreen_collected

signal enemyHit


signal playerHit1
signal playerHit2
signal playerHit3

signal shot_charged



#Save state

signal saveState_loaded
signal saveState_saved
signal save

var is_saving = false



var saved_player_posX = player_posX
var saved_player_posY = player_posY

var saved_level_score = level_score

var loadingZone_current = "none"



#Background change

signal bgChange_entered
signal bgMove_entered
signal bgTransition_finished

var bgFile_previous = preload("res://Assets/Graphics/bg1.png")
var bgFile_current = preload("res://Assets/Graphics/bg1.png")

var bgOffset_target_x = 0
var bgOffset_target_y = 0


var test = 0
var test2 = 0
var test3 = 0
var test4 = "none"

