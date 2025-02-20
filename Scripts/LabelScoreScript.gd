extends Label

@export var GameSceneRoot : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameSceneRoot.OnGameEnd.connect(DisplayScore)

func DisplayScore(Score : int):
	self.text = "Final Score: " + str(Score)
