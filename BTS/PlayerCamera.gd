extends Camera3D

var camera_pos: Vector3 = Vector3(0.0,0.0,0.0)
var camera_offset_y = 10
var camera_offset_z = 5


func _ready():
	await get_tree().physics_frame
	camera_pos = PlayerPosition.player_pos
	camera_pos.y += camera_offset_y
	camera_pos.z += camera_offset_z
	set_global_position(camera_pos)

func _process(delta):
	camera_pos = PlayerPosition.player_pos
	camera_pos.y += camera_offset_y
	camera_pos.z += camera_offset_z
	set_global_position(camera_pos)
