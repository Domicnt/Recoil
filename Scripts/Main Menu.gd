extends Control

func _on_Continue_pressed():
	Global.goto_scene("res://Scenes/Level Select.tscn");

func _on_New_Gane_pressed():
	Global.goto_scene("res://Scenes/Level Select.tscn");

func _on_Options_pressed():
	Global.goto_scene("res://Scenes/Options.tscn");

func _on_Exit_pressed():
	get_tree().quit();
