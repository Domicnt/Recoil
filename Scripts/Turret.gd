extends Node2D

const Projectile = preload("res://Scenes/Instances/Turret_Projectile.tscn");

onready var player = get_node("../Player");

onready var time = OS.get_ticks_msec();

func _physics_process(delta):
	var angle = PI/2 + atan2(player.global_position.y - $Sprite2.global_position.y, player.global_position.x - $Sprite2.global_position.x);#$Sprite2.global_position.angle_to(player.global_position);
	
	$Sprite2.rotation = max(min(angle, 1.4), -1.4);
	
	if (OS.get_ticks_msec() - time >= 1000 && angle >= -1.5 && angle <= 1.5):
		shoot();
		time = OS.get_ticks_msec();

func shoot():
	var projectile = Projectile.instance();
	Global.add_child(projectile);
	projectile.vel = Vector2(cos($Sprite2.rotation - PI/2), sin($Sprite2.rotation - PI/2)) * 10;
	projectile.global_position = self.global_position + projectile.vel * 3;
