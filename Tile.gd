class_name Tile
extends ColorRect

var collision_area: Area2D

func _init() -> void:
    collision_area = Area2D.new()
    # Do not collide with yourself, plz
    collision_area.collision_mask = 0
    add_child(collision_area)
    collision_area.connect("area_entered", self, "_on_entered")
    collision_area.connect("body_entered", self, "_on_entered")

func _on_entered(other: Node) -> void:
    $AnimationPlayer.play("pulse")

# Add collision thing
func _enter_tree() -> void:
    # Usind CollisionShape2D in the editor is much simpler, but there you go, I found this to be easier when programmatically setting the extent:
    var collision_shape = RectangleShape2D.new()
    collision_shape.extents = rect_size / 2
    var shape_owner = collision_area.create_shape_owner(collision_area)
    collision_area.shape_owner_add_shape(shape_owner, collision_shape)
