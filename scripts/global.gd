extends Node

var dialogs
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dialogs_file: FileAccess = FileAccess.open("res://resources/dialogs.json", FileAccess.READ)

	if dialogs_file:
		var content: String = dialogs_file.get_as_text()
		dialogs_file.close()
		dialogs = JSON.parse_string(content)
		if dialogs:
			dialogs = dialogs.result["convs"]
	
	read_conversation(1)

func write_dialog_line(conv):
	for dlg in conv:
		if dlg["nom"] and dlg["texte"]:  # Vérifie que les clés existent
			print(dlg["nom"] + " : " + dlg["texte"])

func read_conversation(id: int):
	if dialogs:
		for dlg in dialogs:
			if dlg["conv_id"] == id:
				write_dialog_line(dlg["conv"])
				return
		print("Conversation avec l'ID ", id, " introuvable.")
	else:
		print("Aucune donnée de dialogue chargée.")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
