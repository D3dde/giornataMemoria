extends Node3D

@export var camera : Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_static_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.is_action_pressed("click"):
			print("Collision shape clicked!")
			var tween = get_tree().create_tween()
			tween.tween_property(camera, "position", $items/immagine/Marker3D.position, 1)
			$items/immagine/Label.show()


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.is_action_pressed("esc"):
		print("Returning to default position")
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "position", $DefaultPosition.position, 1)
		$items/immagine/Label.hide()
