extends Control

onready var time = get_node("MarginContainer/MarginContainer/VBoxContainer/RichTextLabel");

func _ready():
	if Global.current_stage >= 19:
		$MarginContainer/MarginContainer/VBoxContainer/Continue.visible = false;

func _physics_process(delta):
	time.bbcode_text = "[center]Time: " + str(float(Global.time) / 1000) + "s";

func _on_Continue_pressed():
	get_tree().paused = false;
	Global.current_stage += 1;
	Global.goto_scene("res://Scenes/Levels/" + str(Global.current_stage + 1) + ".tscn");

func _on_Restart_pressed():
	get_tree().paused = false;
	Global.goto_scene(get_tree().current_scene.filename);

func _on_Exit_pressed():
	get_tree().paused = false;
	Global.goto_scene("res://Scenes/Main Menu.tscn");
