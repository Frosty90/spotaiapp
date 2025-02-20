extends Node

var ActiveSet: Resource
@export var ImageCollection: Resource 
@export var DifficultySetting: Resource
@export var GameSceneRoot: Node2D

var NewTimer : Timer
var PlayerScore = 0
var PlayerLives = 0
var RemainingTime = 0
var QuizActive = false

@onready var ImageA = $ImageContainer/ImageA
@onready var ImageB = $ImageContainer/ImageB
@onready var ImageC = $ImageContainer/ImageC
@onready var ImageD = $ImageContainer/ImageD
@onready var Prompt = $GamePrompt
@onready var ImageContainer = $ImageContainer
@onready var TimerText = $GameTimerText
@onready var ScoreText = $GameScore
@onready var LivesText = $GameLives



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	get_parent().OnScreenVisible.connect(QuizScreenVisible)


func _process(_delta: float) -> void:
	
	if (QuizActive):
		TimerText.text = str(int(NewTimer.time_left))
		ScoreText.text = str(PlayerScore)

func QuizScreenVisible():
	print("Game screen visible!")
	StartNewRound(true,null)


#
func StartNewRound(bInitialRound : bool, ExistingTimer : Timer) -> void:

	
	ActiveSet = ImageCollection.SelectRandomImageSet()	
	
	ImageA.set_texture(ActiveSet.GetCorrectImage())
	ImageB.set_texture(ActiveSet.GetWrongImageFromIndex(0))
	ImageC.set_texture(ActiveSet.GetWrongImageFromIndex(1))
	ImageD.set_texture(ActiveSet.GetWrongImageFromIndex(2))
	
	Prompt.set_text(ActiveSet.GetPromptText())
	
	if (bInitialRound):
		QuizActive = true
		PlayerLives = DifficultySetting.GetStartingLives()
		if (PlayerLives == int(INF)): LivesText.text = "Infinite"
		else: LivesText.text = str(PlayerLives)
		NewTimer = InstantiateGameTimer(1.0)
		NewTimer.start(DifficultySetting.GetStartingTime())

	else:
		ExistingTimer.start(ExistingTimer.time_left + 5)
		

func InstantiateGameTimer(Delay : float) -> Timer:

	var GameTimer = Timer.new()
	GameTimer.wait_time = Delay
	GameTimer.timeout.connect(GameTimerEnd)
	add_child(GameTimer)
	return GameTimer

func GameTimerEnd() -> void:
	EndGame(false)

func UpdateImageContainerSize(NewSize: float) -> void:
	ImageContainer.offset_left = -NewSize
	ImageContainer.offset_right = NewSize

func SubmitPlayerAnswer(InputPath: NodePath) -> void:
	
	var ImageNode = get_node(InputPath)
	print(InputPath	)
	if(ImageNode.texture == ActiveSet.GetCorrectImage()):
		
		PlayerScore += 6
		StartNewRound(false,NewTimer)
	else:
		PlayerScore = PlayerScore - 4 if PlayerScore - 4 > 0 else 0
		if(PlayerLives != int(INF)): 
			PlayerLives -= 1
			LivesText.text = str(PlayerLives)

			if(PlayerLives <= 0): EndGame(false)
			

	

func EndGame(WonGame: bool) -> void:

	GameSceneRoot.ShowGameEndScreen(PlayerScore)
	print("GAME OVER")
	

#These events correspond to the buttons on screen
func _on_button_a_pressed(extra_arg_0: NodePath) -> void:
	SubmitPlayerAnswer(extra_arg_0)

func _on_button_b_pressed(extra_arg_0: NodePath) -> void:
	SubmitPlayerAnswer(extra_arg_0)

func _on_button_c_pressed(extra_arg_0: NodePath) -> void:
	SubmitPlayerAnswer(extra_arg_0)

func _on_button_d_pressed(extra_arg_0: NodePath) -> void:
	SubmitPlayerAnswer(extra_arg_0)
