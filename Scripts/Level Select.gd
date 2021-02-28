extends Control

onready var levels_node = get_node("MarginContainer/ScrollContainer/HBoxContainer");
var levels = Array();

func _ready():
	for i in levels_node.get_children():
		levels.push_back(i);
	for i in levels.size():
		get_node(str(levels[i].get_path()) + "/MarginContainer/Start").connect("pressed", self, "_on_level_select", [i]);
		levels[i].visible = i <= Global.stage;
		get_node(str(levels[i].get_path()) + "/MarginContainer/VBoxContainer/RichTextLabel").bbcode_text = "[center]Level " + str(i + 1);
		if Global.stage_times.size() >= i + 1:
			get_node(str(levels[i].get_path()) + "/MarginContainer/VBoxContainer/RichTextLabel2").bbcode_text = "[center]Time: " + str(float(Global.stage_times[i]) / 1000) + "s[/center]";

func _on_level_select(i):
	if (i <= Global.stage):
		Global.current_stage = i;
		Global.goto_scene("res://Scenes/Levels/" + str(i+1) + ".tscn");

func _on_Back_pressed():
	Global.goto_scene("res://Scenes/Main Menu.tscn");
