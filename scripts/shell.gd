extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const VILLE = preload("res://scenes/levels/ville.tscn")
var index = 0

func _process(delta: float) -> void:
	if index == 25:
		$TextureButton.visible = false
		$next.visible = true

func _on_texture_button_pressed() -> void:
	index += 1
	self.position.y -= 5
	animation_player.play("shake")


func _on_next_pressed() -> void:
	self.get_parent().get_parent().add_child(VILLE.instantiate())
	self.get_parent().queue_free()
