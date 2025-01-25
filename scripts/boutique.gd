extends Node2D

@onready var timer: Timer = $Timer

@export var text : Control
@export var npc : Sprite2D

var score : int
var mistake : int

var cans : bool
var seaweed : bool
var savon : bool
var statue : bool
var bible : bool
var poppaper : bool 

func _ready() -> void:
	timer.start()
	activate_item()

func _process(delta: float) -> void:
	if mistake == 3:
		lose()
	elif timer.time_left == 0:
		win()

func activate_item():
	var rand = randi_range(0,5)
	
	match rand :
		0:
			disable_all()
			cans=true
		1:
			disable_all()
			seaweed=true
		2:
			disable_all()
			savon=true
		3:
			disable_all()
			statue=true
		4:
			disable_all()
			bible=true
		5:
			disable_all()
			poppaper=true

func disable_all():
	cans=false
	seaweed=false
	savon=false
	statue=false
	bible=false
	poppaper=false

func win():
	print(score)
	self.queue_free()

func lose():
	print(score)
	self.queue_free()

func _on_cans_pressed() -> void:
	if cans:
		score += 15
		activate_item()
	else:
		score -= 30
		mistake += 1
		activate_item()

func _on_seaweed_pressed() -> void:
	if seaweed:
		score += 15
		activate_item()
	else:
		score -= 30
		mistake += 1
		activate_item()

func _on_savon_pressed() -> void:
	if savon:
		score += 15
		activate_item()
	else:
		score -= 30
		mistake += 1
		activate_item()

func _on_statue_pressed() -> void:
	if statue:
		score += 15
		activate_item()
	else:
		score -= 30
		mistake += 1
		activate_item()

func _on_bible_pressed() -> void:
	if bible:
		score += 15
		activate_item()
	else:
		score -= 30
		mistake += 1
		activate_item()

func _on_poppaper_pressed() -> void:
	if bible:
		score += 15
		activate_item()
	else:
		score -= 30
		mistake += 1
		activate_item()
