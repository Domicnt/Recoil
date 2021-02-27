extends Control

onready var displayMode = get_node("MarginContainer/MarginContainer/VBoxContainer/DisplayMode");

func _ready():
	displayMode.add_item("Windowed");
	displayMode.add_item("Borderless");
	displayMode.add_item("Fullscreen");
	displayMode.select(Global.get_display_mode());

func _on_DisplayMode_item_selected(index):
	Global.set_display_mode(index);

func _on_Back_pressed():
	Global.goto_scene("res://Scenes/Main Menu.tscn");
