extends RigidBody3D

@export var target = Node3D
@export var speed = 1
@export var distanceThreshold = 0.5

var targetPos
var moveToPos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	MoveCamera(delta)


func MoveCamera(delta):
	targetPos = target.position
	moveToPos = (targetPos - position).normalized()
	
	if(position.distance_to(targetPos) > distanceThreshold):
		move_and_collide(moveToPos * delta)
