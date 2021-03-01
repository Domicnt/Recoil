extends Control

func _on_Restart_pressed():
	get_tree().paused = false;
	Global.goto_scene(get_tree().current_scene.filename);

func _on_Exit_pressed():
	get_tree().paused = false;
	Global.goto_scene("res://Scenes/Main Menu.tscn");
