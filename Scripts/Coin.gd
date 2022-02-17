extends Area2D


func _on_Coin_body_entered(body: Node) -> void:
	Events.emit_signal("pickedUpCoin")
	queue_free()


