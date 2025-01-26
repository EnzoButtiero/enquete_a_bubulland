extends Node2D
const boutique = preload("res://scenes/levels/boutique.tscn")

func _on_boutique_pressed() -> void:
	self.get_parent().add_child(boutique.instantiate())
	self.queue_free()
	
