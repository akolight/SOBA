class_name MinionChaseState
extends State

@export var actor: Minion
#@export var animator: AnimationTree
@export var nav_agent: NavigationAgent3D
@export var vision_area: Area3D
var target

signal lost_target

func _ready():
	set_physics_process(false)

func set_movement_target():
		nav_agent.set_target_position(target.position)
	#elif actor.is_in_group("red"):
		#nav_agent.set_target_position(target)
	#print(nav_agent.target_position)
	
func _enter_state() -> void:
	set_physics_process(true)
	#animator.play("move")
	var current_position: Vector3 = actor.global_position
	var next_path_position: Vector3 = nav_agent.get_next_path_position()
	next_path_position.y = 0
	next_path_position = next_path_position.normalized()
	print(next_path_position)
	actor.look_at(next_path_position)
	actor.velocity = current_position.direction_to(next_path_position) * actor.movement_speed

func _exit_state() -> void:
	set_physics_process(false)

func _physics_process(delta):
	pass


func _on_vision_range_body_exited(body):
	lost_target.emit()


func _on_minion_path_state_found_target(body):
	target = body
	#print(target)
	set_movement_target()
