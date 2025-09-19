extends Node

## Beginning city resources. 
const STARTING_POPULATION: int = 0
const STARTING_POLLUTION: int = 0
const STARTING_GOODS: int = 0
const STARTING_ENERGY: int = 0 

## Current city resources.
var current_population: int = 0
var current_pollution: int = 0
var current_goods: int = 0
var current_energy: int = 0

# Modifers affecting building resource output. 
var population_output_mod: int
var pollution_output_mod: int
var goods_output_mod: int
var energy_output_mod: int

var population_demand_mod: int
var pollution_demand_mod: int
var goods_demand_mod: int
var energy_demand_mod: int

var buildings_array: Array[Building] = []

func _ready() -> void:
	current_population = STARTING_POPULATION
	current_pollution = STARTING_POLLUTION
	current_goods = STARTING_GOODS
	current_energy = STARTING_ENERGY

func update_resources() -> void:
	# Calculate law modifers
	# Calculate resources modifer
	# Apply resource input and output from each building to the city's total
	for building in buildings_array:
		# Apply building demand 
		current_population -= building.building_resource.population_demand + population_demand_mod
		current_pollution -= building.building_resource.pollution_demand + pollution_demand_mod
		current_energy -= building.building_resource.energy_demand + energy_demand_mod
		current_goods -= building.building_resource.goods_demand + goods_demand_mod
		# Apply building output
		current_population += building.building_resource.population_output + population_output_mod
		current_pollution += building.building_resource.pollution_output + pollution_output_mod
		current_energy += building.building_resource.energy_output + energy_output_mod
		current_goods += building.building_resource.goods_output + goods_output_mod
