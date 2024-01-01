extends Node3D

@export var blue_melee_minion: PackedScene

var minion_count = 0
var wave_size = 3


func _ready():
	PlayerPosition.red_nexus_pos = $"../../RedNexus".position


func _on_wave_timer_timeout():
	if minion_count < wave_size:
		minion_count += 1
	else:
		$"../WaveTimer".stop()
		$"../GapTimer".start()
		minion_count = 0
	# Create a new instance of the minion scene
	var minion = blue_melee_minion.instantiate()
	
	var minion_spawn_location = self.global_position
	add_child(minion)

func _on_gap_timer_timeout():
	# This checks to see how many minions there are, 
	# and starts the timer for the next wave
	if minion_count < 3:
		$"../WaveTimer".start()
	else:
		$"../GapTimer".start()
