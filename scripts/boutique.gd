extends Node2D
const VILLE = preload("res://scenes/levels/ville.tscn")
const SARDINE_1 = preload("res://assets/sprites/sardine/sardine_1.png")
const SARDINE_2 = preload("res://assets/sprites/sardine/sardine_2.png")
const SARDINE_3 = preload("res://assets/sprites/sardine/sardine_3.png")
const SARDINE_4 = preload("res://assets/sprites/sardine/sardine_4.png")

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $Npc/AnimationPlayer
@onready var npc: Sprite2D = $Npc
@export var text : Control
@onready var label: Label = $Npc/Label
@onready var score_t: Label = $Score

var score : int
var mistake : int

var cans : bool
var seaweed : bool
var savon : bool
var statue : bool
var bible : bool
var poppaper : bool 

var ville

func _ready() -> void:
	ville = VILLE.instantiate()
	timer.start()
	activate_item()

func _process(delta: float) -> void:
	print(self.get_parent())
	score_t.text = str(score)
	if mistake == 3:
		self.add_child(VILLE.instantiate())
		lose()
	elif timer.time_left == 0:
		self.add_child(VILLE.instantiate())
		win()

func activate_item():
	var rand_sard = randi_range(0,3)
	match rand_sard:
		0:
			npc.texture = SARDINE_1
		1:
			npc.texture = SARDINE_2
		2:
			npc.texture = SARDINE_3
		3:
			npc.texture = SARDINE_4
	animation_player.play("arrived")
	var rand = randi_range(0,5)
	
	match rand :
		0:
			disable_all()
			label.text="flacon à bulles"
			cans=true
		1:
			disable_all()
			label.text="algue"
			seaweed=true
		2:
			disable_all()
			label.text="savon"
			savon=true
		3:
			disable_all()
			label.text="statue"
			statue=true
		4:
			disable_all()
			label.text="bible"
			bible=true
		5:
			disable_all()
			label.text="papier bulle"
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
	self.visible = false

func lose():
	print(score)
	self.visible = false

func _on_cans_pressed() -> void:
	if cans:
		score += 15
		animation_player.play("exited")
		activate_item()
	else:
		score -= 30
		mistake += 1
		animation_player.play("exited")
		activate_item()

func _on_seaweed_pressed() -> void:
	if seaweed:
		score += 15
		animation_player.play("exited")
		activate_item()
	else:
		score -= 30
		mistake += 1
		animation_player.play("exited")
		activate_item()

func _on_savon_pressed() -> void:
	if savon:
		score += 15
		animation_player.play("exited")
		activate_item()
	else:
		score -= 30
		mistake += 1
		animation_player.play("exited")
		activate_item()

func _on_statue_pressed() -> void:
	if statue:
		score += 15
		animation_player.play("exited")
		activate_item()
	else:
		score -= 30
		mistake += 1
		animation_player.play("exited")
		activate_item()

func _on_bible_pressed() -> void:
	if bible:
		score += 15
		animation_player.play("exited")
		activate_item()
	else:
		score -= 30
		mistake += 1
		animation_player.play("exited")
		activate_item()

func _on_poppaper_pressed() -> void:
	if poppaper:
		score += 15
		animation_player.play("exited")
		activate_item()
	else:
		score -= 30
		mistake += 1
		animation_player.play("exited")
		activate_item()
