extends Node2D

onready var time = OS.get_ticks_msec();

func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		Global.set_stage_time(Global.current_stage, OS.get_ticks_msec() - time);
		Global.current_stage = -1;
		Global.goto_scene("res://Scenes/Level Select.tscn");
