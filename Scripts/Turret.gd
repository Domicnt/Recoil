extends Node2D

onready var player = get_node("../../Player");

func _physics_process(delta):
	var angle = PI/2 + atan2(player.global_position.y - $Sprite2.global_position.y, player.global_position.x - $Sprite2.global_position.x);#$Sprite2.global_position.angle_to(player.global_position);
	angle = max(min(angle, 1.3), -1.3);

	$Sprite2.rotation = angle;
