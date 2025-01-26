extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var index = 0

func _process(delta: float) -> void:
	if index == 25:
		self.queue_free()

func _on_texture_button_pressed() -> void:
	index += 1
	self.position.y -= 5
	animation_player.play("shake")
