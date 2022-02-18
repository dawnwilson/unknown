extends Area2D

onready var crackedImage = preload("res://Assets/temp_Vase_Cracked.png")

onready var smashedVase = preload("res://Scenes/SmashedVase.tscn")
onready var coin = preload("res://Scenes/Coin.tscn")

var random = RandomNumberGenerator.new()
var health: int = 2


func _ready() -> void:
	random.randomize()
	

func _on_Vase_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		area.queue_free()
	health -= 1
	
	if health == 1:
		$Sprite.texture = crackedImage
	elif health == 0:
		var newSmashedVase = smashedVase.instance()
		newSmashedVase.transform = global_transform
		owner.add_child(newSmashedVase)
		# create a new smashedVase scene and destroy this one.
		if chooseToInstanceCoin():
			var newCoin = coin.instance()
			newCoin.transform = global_transform
			owner.add_child(newCoin)
		queue_free()


func chooseToInstanceCoin() -> bool:
	return random.randi_range(0, 1)
