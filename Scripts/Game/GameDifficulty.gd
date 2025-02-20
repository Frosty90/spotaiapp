extends Resource

@export var DifficultyName = ""
@export var QuestionAmount : int = 10
@export var StartingTime : int = 0
@export var StartingLives : int = int(INF)
@export var ScoreMultiplier : float = 1.0


func GetDifficultyName() -> String:
    return DifficultyName
 
func GetQuestionAmount() -> int:
    return QuestionAmount

func GetStartingTime() -> int:
    return StartingTime

func GetStartingLives() -> int:
    return StartingLives


func SetQuestionAmount(Amt : int) -> void:
    QuestionAmount = Amt

func SetStartingTime(ST : int) -> void:
    StartingTime = ST

func SetStartingLives(SL : int) -> void:
    StartingLives = SL
