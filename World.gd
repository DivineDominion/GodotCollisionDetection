extends Node2D

# The `Tile` template that we'll be adding to this world
var Tile: PackedScene = load("res://Tile.tscn")

## Used to compute the layout on screen ##

# How many tiles should fit horizontally on the screen
const TILE_COUNT: int = 100
# Height of each tile, and thus each row
const TILE_HEIGHT: float = 100.0
# Gap between row 1 and 2
const ROW_GAP: float = 20.0

onready var screen_size: Vector2 = get_viewport_rect().size
var first_row_y: float

func _ready() -> void:
    # Vertically center both rows, and compute the first row's Y position based on the resolution
    first_row_y = (screen_size.y - TILE_HEIGHT * 2 - ROW_GAP) / 2
    # Position kinematic player variant inside the first row
    $PlayerBody.position = Vector2(0, first_row_y + TILE_HEIGHT / 2)
    add_collision_areas()

func add_collision_areas() -> void:
    var tile_width = screen_size.x / TILE_COUNT
    var tile_height = 100
    for column in range(TILE_COUNT):
        var tile: ColorRect = Tile.instance()
        tile.rect_position = Vector2(
            column * tile_width,
            first_row_y
        )
        tile.rect_size = Vector2(tile_width, TILE_HEIGHT)
        add_child(tile)
