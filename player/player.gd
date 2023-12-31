extends CharacterBody3D

var movement_speed: float = 7.0
var movement_target_position: Vector3 = Vector3(0.0,0.0,0.0)

@onready var navigation_agent: NavigationAgent3D = $PlayerNavAgent

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5
	
	# Make sure to not await during _ready.
	call_deferred("actor_setup")

func actor_setup():
	# Wait for the first physics frame so the Navigation Server can sync.
	await get_tree().physics_frame
	
	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
	
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()
	look_at(next_path_position)
	
	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	PlayerPosition.player_pos.x = self.global_position.x
	PlayerPosition.player_pos.z = self.global_position.z
	move_and_slide()



func _on_static_body_3d_input_event(camera, event, click_position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$"../Marker".transform.origin = click_position
		movement_target_position = click_position
		set_movement_target(movement_target_position)
