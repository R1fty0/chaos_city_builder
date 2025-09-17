extends Node3D

@export var tile_scene = preload("res://scenes/world/tile/tile.tscn")

func add_new_tile(existing_tile: Tile) -> void:
	# Get the free adjacent tiles surrounding the pre-existing tile
	var free_adj_tiles = existing_tile.adj_tile_checker.free_tiles
	# Prevent a tile from being added if there are no free tiles avaliable
	if free_adj_tiles.is_empty():
		return
	# Choose a random direction.
	var new_tile_index = randf_range(0, free_adj_tiles.size())
	# Get the position of the where the new tile should go. 
	var new_tile_pos = free_adj_tiles[new_tile_index].position
	# Place a new tile.
	var new_tile = tile_scene.instantiate()
	add_child(new_tile)
	new_tile.global_position = new_tile_pos
