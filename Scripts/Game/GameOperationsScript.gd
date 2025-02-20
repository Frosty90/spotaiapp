extends Node

signal OnGameViewportChanged(NewState : int)
signal OnGameEnd(FinalScore : int)

enum ActiveScreen {AS_MainMenu,AS_GameConfig,AS_Gameplay,AS_GameEnd}
enum GameEndReason {GER_Lose,GER_Interrupted,GER_Win}


func TestMethod() -> void:
	print("Test method print")

func SetActiveScreen(ScreenSel: ActiveScreen) -> void:
	
	OnGameViewportChanged.emit(ScreenSel)

		
func ShowGameEndScreen(FinalScore : int) -> void:
	
	OnGameViewportChanged.emit(3)
	OnGameEnd.emit(FinalScore)
