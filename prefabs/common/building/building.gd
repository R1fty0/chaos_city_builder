extends Node3D
class_name Building

@export var building_resource: BuildingResource

func _ready() -> void:
	# Tell the resource manager that this building exists when it enters the scene tree. 
	ResourceManager.buildings_array.append(self)
