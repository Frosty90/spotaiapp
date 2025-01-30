extends Resource

@export var test: Array[Resource]
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func SelectImageSet(Index := 0) -> Resource:
	return test[Index]
	
func SelectRandomImageSet() -> Resource:
	
	var SelectedIndex = rng.randi_range(0,test.size() - 1)
	return test[SelectedIndex]
	
	
