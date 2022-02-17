extends Node

var playerHealth: Dictionary = {1: 100, 2: 100}


func _ready() -> void:
	Events.connect("playerHurt", self, "damagePlayer")


func damagePlayer(playerId: int, damageAmount: int) -> void:
	playerHealth[playerId] -= damageAmount
	if playerHealth[playerId] <= 0:
#		position = lastCheckpoint
		playerHealth[playerId] = 100
