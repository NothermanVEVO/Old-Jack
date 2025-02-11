extends Entity

const JUMP_VELOCITY = -500.0

func _physics_process(delta: float) -> void:
	var pseudo_direction = Input.get_axis("Move Left", "Move Right")
	if not is_on_floor():
		direction.x = pseudo_direction if pseudo_direction else direction.x
		velocity += get_gravity() * delta
		direction.x *= 0.9
	else:
		direction.x = pseudo_direction

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
