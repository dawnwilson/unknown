extends KinematicBody2D

var bullet = preload("res://Scenes/Bullet.tscn")

var lastCheckpoint: Vector2 = Vector2(38, 38)
export (int) var id = 0
export (int) var speed = 200
var shootSpeed: int = 50

var velocity = Vector2()


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right_%s" % id):
		velocity.x += 1
	if Input.is_action_pressed("left_%s" % id):
		velocity.x -= 1
	if Input.is_action_pressed("down_%s" % id):
		velocity.y += 1
	if Input.is_action_pressed("up_%s" % id):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("shoot_%s" % id):
		var newBullet = bullet.instance()
		owner.add_child(newBullet)
		newBullet.transform = $FirePoint.global_transform


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
