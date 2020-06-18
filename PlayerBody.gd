extends KinematicBody2D

var speed: float = 200
var velocity: Vector2 = Vector2()
onready var screen_size: Vector2 = get_viewport_rect().size

func _input(event: InputEvent) -> void:
    self.velocity = Vector2()
    if Input.is_action_pressed("ui_right"):
        self.velocity.x = 1
    if Input.is_action_pressed("ui_left"):
        self.velocity.x = -1
    if Input.is_action_pressed("ui_down"):
        self.velocity.y = 1
    if Input.is_action_pressed("ui_up"):
        self.velocity.y = -1

func _physics_process(delta: float) -> void:
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        move_and_collide(velocity * delta)

func _process(delta: float) -> void:
    # Limit position to screen size
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)
