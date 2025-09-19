extends Area3D
class_name OutlineComponent

# NOTE: All meshes that use this component require a weighted normals modifier in Blender. 
# Credit: https://www.youtube.com/watch?v=CG0TMH8D8kY

signal selected
signal unselected

@export_category("Outlines")
@export var mesh: MeshInstance3D
@export var outline_material: Material
@export var selection_material: Material

var is_selected: bool = false

func _ready() -> void:
	# Connect relevant signals. 
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)
	self.input_event.connect(_on_input_event)

func _on_mouse_entered() -> void:
	# Enable the hover outline. 
	if is_selected == false:
		mesh.material_overlay = outline_material

func _on_mouse_exited() -> void:
	# Disable the hover outline. 
	if is_selected == false:
		mesh.material_overlay = null

func _unhandled_input(event: InputEvent) -> void:
	# Unselect the object if the player clicks elsewhere. 
	if event.is_action_pressed("select") and is_selected:
		mesh.material_overlay = null
		unselected.emit()
		is_selected = false

func _on_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	# Apply selected outline
	if event.is_action_pressed("select"):
		if not is_selected:
			mesh.material_overlay = selection_material
			is_selected = true
			selected.emit()
