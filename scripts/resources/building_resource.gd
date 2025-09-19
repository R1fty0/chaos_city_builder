extends Resource
class_name BuildingResource

@export var name: String = "BuildingName"
@export_category("Resources")
@export_group("Demand")
@export var population_demand: int = 0
@export var pollution_demand: int = 0
@export var energy_demand: int = 0
@export var goods_demand: int = 0
@export_group("Output")
@export var population_output: int = 0
@export var pollution_output: int = 0
@export var energy_output: int = 0
@export var goods_output: int = 0
