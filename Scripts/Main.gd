extends Node

onready var viewport1 = $Viewports/ViewportContainer1/Viewport1
onready var viewport2 = $Viewports/ViewportContainer2/Viewport2
onready var camera1 = $Viewports/ViewportContainer1/Viewport1/Camera2D
onready var camera2 = $Viewports/ViewportContainer2/Viewport2/Camera2D
onready var world = $Viewports/ViewportContainer1/Viewport1/TestLevel


func _ready() -> void:
	viewport2.world_2d = viewport1.world_2d
	$Minimap/Viewport.world_2d = viewport1.world_2d
	camera1.target = world.get_node("Player1")
	camera2.target = world.get_node("Player2")
	setCameraLimits()


func setCameraLimits() -> void:
	var mapLimits = world.get_used_rect()
	var mapCellSize = world.cell_size
	for cam in [camera1, camera2]:
		cam.limit_left = mapLimits.position.x * mapCellSize.x
		cam.limit_right = mapLimits.end.x * mapCellSize.x
		cam.limit_top = mapLimits.position.y * mapCellSize.y
		cam.limit_bottom = mapLimits.end.y * mapCellSize.y
