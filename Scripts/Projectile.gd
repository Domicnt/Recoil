extends Node2D

var vel = Vector2.ZERO;

func _physics_process(delta):
	position += vel;
