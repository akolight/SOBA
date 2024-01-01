extends Control

func _process(delta):
	$WaveTimerLbl.set_text(str($"../MinionSpawn/WaveTimer".time_left))
	$MinionGoal.set_text(str(PlayerPosition.red_nexus_pos))
