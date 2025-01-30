extends Node


var ActiveSet: Resource
@export var ImageCollection: Resource 
@export var TIMER_UPDATE_RATE = 1.0
var StartingTime
var NewTimer : Timer

@onready var ImageA = $ImageContainer/ImageA
@onready var ImageB = $ImageContainer/ImageB
@onready var ImageC = $ImageContainer/ImageC
@onready var ImageD = $ImageContainer/ImageD
@onready var Prompt = $GamePrompt
@onready var ImageContainer = $ImageContainer
@onready var TimerText = $GameTimerText


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StartNewRound()



func StartNewRound() -> void:
	
	ActiveSet = ImageCollection.SelectRandomImageSet()	

	ImageA.set_texture(ActiveSet.GetCorrectImage())
	ImageB.set_texture(ActiveSet.GetWrongImageFromIndex(0))
	ImageC.set_texture(ActiveSet.GetWrongImageFromIndex(1))
	ImageD.set_texture(ActiveSet.GetWrongImageFromIndex(2))
	
	Prompt.set_text(ActiveSet.GetPromptText())

	NewTimer = InstantiateGameTimer(TIMER_UPDATE_RATE)
	NewTimer.start(60)


func _process(delta: float) -> void:
	TimerText.text = str(int(NewTimer.time_left))


func InstantiateGameTimer(Delay : float) -> Timer:

	var GameTimer = Timer.new()
	GameTimer.wait_time = Delay
	GameTimer.timeout.connect(GameTimerUpdate)
	add_child(GameTimer)
	return GameTimer

func GameTimerUpdate() -> void:
	
	if NewTimer.time_left > 0:
		print("Game over!")
		#NewTimer.stop()


func UpdateImageContainerSize(NewSize: float) -> void:
	ImageContainer.offset_left = -NewSize
	ImageContainer.offset_right = NewSize
