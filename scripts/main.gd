extends Node3D


@export var camera : Camera3D
@export var default_position : Marker3D
var focussedBody : StaticBody3D
@export var noise : FastNoiseLite
var i = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_immagine_collision_click(event : InputEvent, node : Node) -> void:
	if event.is_action_pressed("click") and (focussedBody == null):
		print("Collision shape clicked!")
		focussedBody = node
		focussedBody.get_node("Label").show()
		
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "position", node.get_node("Marker3D").global_position, 1).set_trans(Tween.TRANS_CUBIC)
		tween.parallel().tween_property(camera, "rotation", node.get_node("Marker3D").global_rotation, 1).set_trans(Tween.TRANS_CUBIC)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("esc") and (focussedBody != null):
		print("Returning to default position")
		focussedBody.get_node("Label").hide()
		focussedBody = null
		
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "position", default_position.global_position, 1).set_trans(Tween.TRANS_CUBIC)
		tween.parallel().tween_property(camera, "rotation", default_position.global_rotation, 1).set_trans(Tween.TRANS_CUBIC)
