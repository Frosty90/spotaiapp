extends Button

@export var GameSceneRoot : Node2D
@export var ScreenID : int
@export var NextScreenID : int


func _on_pressed() -> void:
	GameSceneRoot.SetActiveScreen(NextScreenID)
