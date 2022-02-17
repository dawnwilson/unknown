extends KinematicBody2D

var damagePower: int = 10
var health: int = 100


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		Events.emit_signal("playerHurt", body.id, damagePower)


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		damage(area.damageAmount)
		area.queue_free()


func damage(damageAmount: int) -> void:
	health -= damageAmount
	if health <= 0:
		queue_free()


