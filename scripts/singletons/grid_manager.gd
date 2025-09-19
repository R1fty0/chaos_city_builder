extends Node3D

# NOTE: This script assumes tiles are at a size of 1x1 metres, and that they are 
# placed in 1 metre intervals

const TILE_SCENE: PackedScene = preload("res://prefabs/common/tile/tile.tscn")

## List of the positions of each tile.
var tile_positions: Array[Vector2i] = []
## List of all tiles.
var tiles: Array[Tile] = []

func _ready() -> void:
	call_deferred("init_tiles")

func init_tiles() -> void:
	for child in get_children():
		if child is Tile:
			add_existing_tile(child)
	
func add_existing_tile(tile: Tile) -> void:
	var position = Vector2i(roundi(tile.global_position.x), roundi(tile.global_position.z))
	if not tile_positions.has(position):
		tile_positions.append(position)
		tiles.append(tile)
	
func get_tile_position(tile: Tile) -> Vector2i:
	var position = Vector2i(roundi(tile.global_position.x), roundi(tile.global_position.z))
	return position
	
func add_new_tile(existing_tile: Tile) -> void:
	# Get position of existing tile 
	var position = get_tile_position(existing_tile)
	
	# Figure out a potenial new tile's position in all four cardinal directions
	var left_pos = Vector2i(position.x + 1, position.y)
	var right_pos = Vector2i(position.x - 1, position.y)
	var forward_pos = Vector2i(position.x, position.y + 1)
	var backward_pos = Vector2i(position.x, position.y - 1)
	
	# Populate a array with these positions. 
	var positions = [
		left_pos, 
		right_pos, 
		forward_pos, 
		backward_pos
	]
	# Check which positions are already populated with a tile and remove them. 
	var free_positions = []
	for pos in positions:
		if not tile_positions.has(pos):
			free_positions.append(pos)
		
	# Choose a random free position. 
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var idx = rng.randi_range(0, free_positions.size() - 1)
	var new_position = free_positions[idx]

	# Add a new tile to the grid 
	var new_tile = TILE_SCENE.instantiate()
	add_child(new_tile)
	new_tile.position = Vector3(new_position.x, 0, new_position.y)
	# Add new tile info to grid manager database
	tile_positions.append(new_position)
	tiles.append(new_tile)
