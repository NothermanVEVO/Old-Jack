extends CharacterBody2D

class_name Entity

@export_range(1, 100000) var life : float
@export_range(0, 100000) var SPEED : float
var direction : Vector2

signal dead

func entity_process(_delta : float):
	if life <= 0.0:
		dead.emit()
