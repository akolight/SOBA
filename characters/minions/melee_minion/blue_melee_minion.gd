class_name Minion
extends CharacterBody3D

@export var movement_speed: float = 4.0
var movement_target_position: Vector3 = Vector3(37.0,0.0,-37.0)

@onready var navigation_agent: NavigationAgent3D = $MinionNavAgent
@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var minion_path_state = $FiniteStateMachine/MinionPathState as MinionPathState
@onready var minion_chase_state = $FiniteStateMachine/MinionChaseState as MinionChaseState

func _ready():
	minion_path_state.found_target.connect(fsm.change_state.bind(minion_chase_state))
	minion_chase_state.lost_target.connect(fsm.change_state.bind(minion_path_state))

func _process(delta):
	#print(global_position)
	pass
