extends Node3D
class_name AdjacentTileChecker

@export var forward_tile: Area3D
@export var left_tile: Area3D
@export var right_tile: Area3D
@export var back_tile: Area3D

var free_tiles: Array[Area3D]

func _ready() -> void:
	if forward_tile:
		forward_tile.body_entered.connect(tile_in_forward_tile)
	if left_tile:
		left_tile.body_entered.connect(tile_in_left_tile)
	if right_tile:
		right_tile.body_entered.connect(tile_in_right_tile)
	if back_tile:
		back_tile.body_entered.connect(tile_in_back_tile)
		
func tile_in_forward_tile(_body):
	free_tiles.append(forward_tile)

func tile_in_left_tile(_body):
	free_tiles.append(left_tile)
	
func tile_in_right_tile(_body):
	free_tiles.append(right_tile)
	
func tile_in_back_tile(_body):
	free_tiles.append(back_tile)

	
