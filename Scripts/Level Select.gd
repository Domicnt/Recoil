extends Control

onready var levels_node = get_node("MarginContainer/HBoxContainer");
var levels = Array();

func _ready():
	for i in levels_node.get_children():
		levels.push_back(i);
	for i in levels.size():
		get_node(str(levels[i].get_path()) + "/MarginContainer/Start").connect("pressed", self, "_on_level_select", [i]);
		levels[i].visible = i <= Global.stage;

func _on_level_select(i):
	if (i <= Global.stage):
		Global.goto_scene("res://Scenes/Levels/" + str(i+1) + ".tscn");

func _on_Back_pressed():
	Global.goto_scene("res://Scenes/Main Menu.tscn");
