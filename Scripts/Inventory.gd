extends Control

var coins: int = 0


func _ready() -> void:
	Events.connect("pickedUpCoin", self, "addCoin")


func addCoin() -> void:
	coins += 1
