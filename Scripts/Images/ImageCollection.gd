extends Resource

@export var test: Array[Resource]
var rng = RandomNumberGenerator.new()


func SelectImageSet(Index := 0) -> Resource:
	return test[Index]
	
func SelectRandomImageSet() -> Resource:
	
	var SelectedIndex = rng.randi_range(0,test.size() - 1)
	return test[SelectedIndex]
	
	

	
	
