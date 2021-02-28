extends RigidBody2D

const Projectile = preload("res://Scenes/Instances/Projectile.tscn");

onready var cannon = get_node("Cannon");
onready var particles = get_node("Cannon/Particles2D");
onready var sprite = get_node("Sprite");

var time = OS.get_ticks_msec();
var charging = false;

func _ready():
	$Sprite2/Sprite3.region_rect.size.x = 0;

func _physics_process(delta):
	
	var angle = get_viewport().get_mouse_position().angle_to_point(sprite.global_transform.origin + get_viewport().get_visible_rect().size / 2 - get_node("Camera2D").get_camera_position());
	cannon.rotation = angle - rotation;
	$Sprite2.rotation = -rotation;
	
	if Input.is_action_pressed("Fire") && !charging && OS.get_ticks_msec() - time > 200:
		time = OS.get_ticks_msec();
		charging = true;
	
	var charge_speed = 2;
	if charging:
		var charge_time = min((OS.get_ticks_msec() - time) * charge_speed, 1000);
		$Sprite2/Sprite3.region_rect.size.x = (65 * charge_time / 1000) - 1;
		if !Input.is_action_pressed("Fire"):
			$Sprite2/Sprite3.region_rect.size.x = 0;
			particles.emitting = true;
			apply_central_impulse(-charge_time * Vector2(cos(angle), sin(angle)));
			
			var projectile = Projectile.instance();
			Global.add_child(projectile);
			projectile.global_position = self.global_position;
			projectile.vel = Vector2(cos(angle), sin(angle)) * charge_time / 50;
			
			time = OS.get_ticks_msec();
			charging = false;
