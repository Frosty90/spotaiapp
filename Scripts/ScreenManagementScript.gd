extends Node

signal OnScreenVisible()
signal OnScreenHidden()

@export var ViewportID : int = 0
@export var GameSceneRoot : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	GameSceneRoot.OnGameViewportChanged.connect(ViewportChanged)


func ViewportChanged(ID: int) -> void:
	
	if (ID == ViewportID):
		self.visible = true
		OnScreenVisible.emit()
	else:
		self.visible = false
		OnScreenHidden.emit()
	
