extends Control

func _input(event):
	if event.is_action_pressed("menu_toggle") && visible == get_tree().paused:
		visible = !visible;
		get_tree().paused = !get_tree().paused;

func _on_Continue_pressed():
	visible = false;
	get_tree().paused = false;

func _on_Restart_pressed():
	get_tree().paused = false;
	Global.goto_scene(get_tree().current_scene.filename);

func _on_Exit_pressed():
	get_tree().paused = false;
	Global.goto_scene("res://Scenes/Main Menu.tscn");
