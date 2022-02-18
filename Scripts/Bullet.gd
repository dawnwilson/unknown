extends Area2D

var damageAmount: int = 50
var speed: int = 500


func _physics_process(delta):
	position += transform.x * speed * delta


func _on_Bullet_area_entered(area: Area2D) -> void:
	queue_free()


func _on_Bullet_body_entered(body: Node) -> void:
	queue_free()
