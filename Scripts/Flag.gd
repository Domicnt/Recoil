extends Node2D

onready var time = OS.get_ticks_msec();
var targets = Array();
var targets_hit = 0;

func _ready():
	for i in get_children():
		if "Target" in i.get_name():
			targets.push_back(i);
			i.connect("area_entered", self, "on_Target_hit", [i]);

func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player") && targets_hit >= targets.size():
		Global.set_stage_time(Global.current_stage, OS.get_ticks_msec() - time);
		Global.time = OS.get_ticks_msec() - time;
		get_tree().paused = Global.current_stage < 19;
		get_node(str(body.get_path()) + "/CanvasLayer/Post Stage Menu").visible = true;

func on_Target_hit(area, i):
	i.visible = false;
	targets_hit += 1;
