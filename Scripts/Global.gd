extends Node

var current_scene = null;

var config = ConfigFile.new();
var err = config.load("user://settings.cfg");

func get_display_mode():
	return config.get_value("display", "mode");
func set_display_mode(mode):
	match mode:
		0: 
			#windowed
			OS.window_fullscreen = false;
			OS.set_window_size(Vector2(853, 480));
			OS.window_borderless = false;
			OS.window_maximized = false;
		1:
			#borderless windowed
			OS.window_fullscreen = false;
			OS.window_borderless = true;
			OS.window_maximized = true;
		2:
			#fullscreen
			OS.window_fullscreen = true;
			OS.window_borderless = false;
			OS.window_maximized = false;
	config.set_value("display", "mode", mode);
	config.save("user://settings.cfg");

var stage = 0;
var stage_times = Array();
var current_stage = -1;
var time = 0;

var save = File.new();
func save_file(file):
	save.set_value("stage", stage);
	save.set_value("stage_times", stage_times);
	save.save("user://" + file + ".cfg");
func load_file(file):
	var err = save.load("user://" + file + ".cfg");
	if err != OK:
		save.set_value("stage", stage);
		save.set_value("stage_times", stage_times);
	else:
		stage = save.get_value("stage");
		stage_times = save.get_value("stage_times");

func get_stage_time(Stage):
	return stage_times[Stage];
func set_stage_time(Stage, time):
	while stage_times.size() <= Stage:
		stage_times.push_back(0);
	if stage <= Stage:
		stage = Stage + 1;
	stage_times[Stage] = time;

func _ready():
	var root = get_tree().get_root();
	current_scene = root.get_child(root.get_child_count() - 1);
	
	if err != OK:
		config.set_value("display", "mode", 1);
	
	#display mode
	set_display_mode(config.get_value("display", "mode"));

	config.save("user://settings.cfg");

func goto_scene(path):
	var projectiles = get_tree().get_nodes_in_group("Projectiles");
	for i in projectiles: 
		i.queue_free()
	call_deferred("_deferred_goto_scene", path);

func _deferred_goto_scene(path):
	current_scene.free();
	var s = ResourceLoader.load(path);
	current_scene = s.instance();
	get_tree().get_root().add_child(current_scene);
	get_tree().set_current_scene(current_scene);
