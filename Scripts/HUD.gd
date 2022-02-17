extends Control

onready var playerHealthLabels: Dictionary = {1: $HBoxContainer/CenterContainer/Player1HealthAmount, 2: $HBoxContainer/CenterContainer3/Player2HealthAmount}
var coinAmountLabel


func _ready() -> void:
	Events.connect("pickedUpCoin", self, "updateCoinUI")
	Events.connect("playerHurt", self, "updatePlayerHealthUI")
	coinAmountLabel = find_node("CoinAmount")


func updateCoinUI() -> void:
	coinAmountLabel.text = str(Inventory.coins)


func updatePlayerHealthUI(playerId: int, damageAmount = 0) -> void:
	playerHealthLabels[playerId].text = str(Global.playerHealth[playerId])
