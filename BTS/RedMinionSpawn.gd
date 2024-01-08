extends Node3D
#
#@export var red_melee_minion: PackedScene
#
#var minion_count = 0
#var wave_size = 2
#
#
#func _ready():
	#pass
#
#
#func _on_wave_timer_timeout():
	#if minion_count < wave_size:
		#minion_count += 1
		#MinionManager.red_minion_count += 1
			## Create a new instance of the minion scene
		#var minion = red_melee_minion.instantiate()
	#
		#var minion_spawn_location = self.global_position
		#add_child(minion)
	#else:
		#$"../WaveTimer".stop()
		#$"../GapTimer".start()
		#minion_count = 0
		#MinionManager.red_minion_count = 0
#
#
#
#func _on_gap_timer_timeout():
	## This checks to see how many minions there are, 
	## and starts the timer for the next wave
	#if minion_count < wave_size:
		#$"../WaveTimer".start()
		#var minion = red_melee_minion.instantiate()
		#var minion_spawn_location = self.global_position
		#add_child(minion)
	#else:
		#$"../GapTimer".start()
