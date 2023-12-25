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


#Background change

signal bgChange_entered

var bgFile_previous = preload("res://Assets/Graphics/bg1.png")
var bgFile_current = preload("res://Assets/Graphics/bg1.png")
