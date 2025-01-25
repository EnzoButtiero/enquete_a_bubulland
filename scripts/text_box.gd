extends Control

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_pressed("pass"):
		_pass()

func _pass():
	self.visible = false
