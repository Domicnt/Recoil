extends RigidBody2D

onready var cannon = get_node("Cannon");
onready var particles = get_node("Cannon/Particles2D");
onready var sprite = get_node("Sprite");

var time = OS.get_ticks_msec();
var charging = false;

func _ready():
	pass

func _physics_process(delta):
	
	var angle = get_viewport().get_mouse_position().angle_to_point(sprite.global_transform.origin + get_viewport().get_visible_rect().size / 2 - get_node("Camera2D").get_camera_position());
	cannon.rotation = angle - rotation;
	
	if Input.is_action_pressed("Fire") && !charging && OS.get_ticks_msec() - time > 200:
		time = OS.get_ticks_msec();
		charging = true;
	
	var charge_speed = 2;
	if !Input.is_action_pressed("Fire") && charging:
		var charge_time = OS.get_ticks_msec() - time;
		charge_time = min(charge_time * charge_speed, 1000);
		
		particles.emitting = true;
		apply_central_impulse(-charge_time * Vector2(cos(angle), sin(angle)));
		time = OS.get_ticks_msec();
		charging = false;
		
