extends StaticBody3D
class_name Tile

@export var outline_component: OutlineComponent

func _ready() -> void:
	if outline_component:
		outline_component.selected.connect(_on_tile_selected)

func _on_tile_selected():
	GridManager.add_new_tile_to_grid(self)
