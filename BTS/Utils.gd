extends Control

func _process(delta):
	$WaveTimerLbl.set_text(str($"../MinionSpawn/WaveTimer".time_left))
	$MinionGoal.set_text(str(MinionManager.blue_minion_count))
	$GapTimerLbl.set_text(str($"../MinionSpawn/GapTimer".time_left))
