extends StaticBody3D
class_name Tile

@export var adj_tile_checker: AdjacentTileChecker
@export var interaction_component: InteractionComponent

func _ready() -> void:
	if interaction_component:
		interaction_component.selected.connect(_on_tile_selected)

func _on_tile_selected():
	GridManager.add_new_tile(self)
