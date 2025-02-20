extends Resource

@export var SetName = "Default"
@export var PromptText = "Default"
@export var CorrectImage : CompressedTexture2D = null
@export var WrongImages : Array[CompressedTexture2D] = []


func GetPromptText() -> String:
	return PromptText

func GetSetName() -> String:
	return SetName

func GetCorrectImage() -> CompressedTexture2D:
	return CorrectImage

func GetWrongImages() -> Array[CompressedTexture2D]:
	return WrongImages

func GetWrongImageFromIndex(index := 0) -> CompressedTexture2D:
	return WrongImages[index]
