extends Node2D

var vel = Vector2.ZERO;

func _physics_process(delta):
	position += vel;
	if (!$Sprite.visible && $Particles2D.emitting == false):
		queue_free();

func _on_Area2D_area_entered(area):
	$Particles2D.emitting = true;
	$Sprite.visible = false;
	$Area2D/CollisionShape2D.set_deferred("disabled", true);

func _on_Area2D_body_entered(body):
	$Particles2D.emitting = true;
	$Sprite.visible = false;
	$Area2D/CollisionShape2D.set_deferred("disabled", true);
