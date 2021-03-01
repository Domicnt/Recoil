extends Control

func _input(event):
	if event.is_action_released("menu_toggle") && visible == true:
		get_tree().paused = false;
		visible = false;

func _ready():
	if visible:
		get_tree().paused = true;
		match get_name():
			"1":
				$MarginContainer/RichTextLabel.bbcode_text = "\n[center]You can charge up a shot by holding down m1 or space, the longer you charge, the faster you'll go!";
			"2":
				$MarginContainer/RichTextLabel.bbcode_text = "\n[center]There are now turrets across the map, you can shoot them to destroy them, or simply go past, but beware!";
			"3":
				$MarginContainer/RichTextLabel.bbcode_text = "\n[center]There are now targets across the map, which must either be shot or rammed before you can finish!";

func _on_Continue_pressed():
	get_tree().paused = false;
	visible = false;
