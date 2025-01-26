extends Node2D
var dialogs
@export var text_box: Control
@onready var nom: Label = $UI/TextBox/nom
@onready var text: RichTextLabel = $UI/TextBox/text

signal pressedEnter

func _ready() -> void:
	var dialogs_file: FileAccess = FileAccess.open("res://resources/dialogs.json", FileAccess.READ)
	if dialogs_file:
		var content: String = dialogs_file.get_as_text()
		dialogs_file.close()
		dialogs = JSON.parse_string(content)
		if dialogs:
			dialogs = dialogs["convs"]
		else:
			print("Erreur lors du parsing JSON ")
	read_conversation(1)

func write_dialog_line(conv):
	var index = 2
	for dlg in conv:
		if dlg["nom"] and dlg["texte"]:  # Vérifie que les clés existent
			print(dlg["nom"] + " : " + dlg["texte"] + str(len(conv)) + " " + "index")
			text_box.visible = true
			text.text = dlg["texte"]
			nom.text = dlg["nom"]
		if len(conv) == index:
			await pressedEnter
			text_box.visible = false
		else:
			await pressedEnter
			index += 2

func read_conversation(id: int):
	if dialogs:
		for dlg in dialogs:
			if dlg["conv_id"] == id:
				write_dialog_line(dlg["conv"])
				return
		print("Conversation avec l'ID ", id, " introuvable.")
	else:
		print("Aucune donnée de dialogue chargée.")

func _input(event):
	if event.is_action_pressed("pass"):
		pressedEnter.emit()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
