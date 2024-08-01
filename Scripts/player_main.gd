extends RigidBody3D

#Variables
var lastMovement = "null"

@export var movementCD = 0.5
var movCD = 0

#Referencias
var player_AP

func _ready() -> void:
	player_AP = $Animations/AnimationPlayer


func _process(delta: float) -> void:
	Move_Input(delta)


func Move_Input(delta):
	#Gestiona el input de movimiento
	if(movCD <= 0):
		if(Input.is_action_just_pressed("move_Forward")):
			ToggleAV(); player_AP.play("move_Forward"); lastMovement = "foward"; movCD = movementCD
		if(Input.is_action_just_pressed("move_Backwards")):
			ToggleAV(); player_AP.play("move_Backwards"); lastMovement = "backwards"; movCD = movementCD
		if(Input.is_action_just_pressed("move_Right")):
			ToggleAV(); player_AP.play("move_Right"); lastMovement = "right"; movCD = movementCD
		if(Input.is_action_just_pressed("move_Left")):
			ToggleAV(); player_AP.play("move_Left"); lastMovement = "left"; movCD = movementCD
	
	#Actualiza el Cooldown de movimiento
	if(movCD > 0):
		movCD = movCD - (1 * delta)
	
	#Actualiza la posicion del jugador luego de ejecutar las animaciones
	if(lastMovement != "null"):
		if(!player_AP.is_playing()):
			ToggleAV()
			if(lastMovement == "foward"): MovePos(Vector3(0, 0, -1))
			if(lastMovement == "backwards"): MovePos(Vector3(0, 0, 1))
			if(lastMovement == "right"): MovePos(Vector3(1, 0, 0))
			if(lastMovement == "left"): MovePos(Vector3(-1, 0, 0))
			lastMovement = "null"

func ToggleAV(): #Intercambia la visibilidad del Player y el Manager de las animaciones
	$MeshInstance3D.visible = !$MeshInstance3D.visible
	$Animations.visible = !$MeshInstance3D.visible


func MovePos(pos):
	position = position + pos
	player_AP.play("idle")
