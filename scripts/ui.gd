extends CanvasLayer
const PLAYER = preload("res://scenes/prefabs/player.tscn")
@onready var main_menu: Control = $MainMenu
@onready var options_menu: Control = $OptionsMenu
@onready var pause_menu: Control = $PauseMenu

var main_menu_on : bool
var options_menu_on : bool
var pause_menu_on : bool

var last_opened : Control

var player

func _ready() -> void:
	player = PLAYER.instantiate()
	main_menu_on = true
	options_menu_on = false
	pause_menu_on = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	main_menu.visible = main_menu_on
	options_menu.visible = options_menu_on
	pause_menu.visible = pause_menu_on
	
	if Input.is_action_just_released("pause") and !main_menu_on:
		pause_menu_on = !pause_menu_on
		last_opened = pause_menu

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_main_options_pressed() -> void:
	main_menu_on = !main_menu_on
	options_menu_on = !options_menu_on
	last_opened = main_menu

func _on_pause_options_pressed() -> void:
	pause_menu_on = !pause_menu_on
	options_menu_on = !options_menu_on
	last_opened = pause_menu

func _on_start_pressed() -> void:
	main_menu_on = false
	self.add_child(player)

func _on_options_back_pressed() -> void:
	options_menu_on = !options_menu_on
	if last_opened == main_menu:
		main_menu_on = !main_menu_on
	elif last_opened == pause_menu:
		pause_menu_on = !pause_menu_on

func _on_pause_back_pressed() -> void:
	pause_menu_on = !pause_menu_on
