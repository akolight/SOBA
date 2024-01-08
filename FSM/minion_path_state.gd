class_name MinionPathState
extends State

@export var actor: Minion
#@export var animator: AnimationTree
@export var nav_agent: NavigationAgent3D
@export var vision_area: Area3D

var red_nexus_position: Vector3 = Vector3(37.0,0.0,-37.0)
var blue_nexus_position: Vector3 = Vector3(-37.0,0.0,37.0)

signal found_target(body)

func _ready():
	set_physics_process(false)

func set_movement_target():
	if actor.is_in_group("blue"):
		nav_agent.set_target_position(red_nexus_position)
	elif actor.is_in_group("red"):
		nav_agent.set_target_position(blue_nexus_position)
	#print(nav_agent.target_position)

func _enter_state() -> void:
	set_physics_process(true)
	set_movement_target()
	#animator.play("move")
	if actor.velocity == Vector3.ZERO:
		var current_position: Vector3 = actor.global_position
		var next_path_position: Vector3 = nav_agent.get_next_path_position()
		next_path_position.y = 0
		next_path_position = next_path_position.normalized()
		actor.look_at(next_path_position)
		actor.velocity = current_position.direction_to(next_path_position) * actor.movement_speed

func _exit_state() -> void:
	set_physics_process(false)

func _physics_process(delta):
	actor.move_and_slide()
	#print()



func _on_vision_range_body_entered(body):
	if body.is_in_group("player") and body.is_in_group("red"):
		found_target.emit(body)
		print("player detected")
	if body.is_in_group("minion") and body.is_in_group("red"):
		print("ohh")
 
