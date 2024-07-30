extends Node3D

var player_AP
var last_Movement = "null"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_AP = $CharacterBody3D/AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Move_Input()

func Move_Input():
	#Gestiona el input de movimiento
	if(!player_AP.is_playing()):
		if(Input.is_action_just_pressed("move_Up")):
			player_AP.play("move_Forward")
			last_Movement = "foward"
		if(Input.is_action_just_pressed("move_Down")):
			player_AP.play("move_Backwards")
			last_Movement = "backwards"
		if(Input.is_action_just_pressed("move_Right")):
			player_AP.play("move_Right")
			last_Movement = "right"
		if(Input.is_action_just_pressed("move_Left")):
			player_AP.play("move_Left")
			last_Movement = "left"
	
	#Actualiza la posicion del jugador luego de ejecutar las animaciones
	if(last_Movement != "null"):
		if(!player_AP.is_playing()):
			if(last_Movement == "foward"):
				player_AP.play("idle")
				position = position + Vector3(0, 0, -1)
			if(last_Movement == "backwards"):
				player_AP.play("idle")
				position = position + Vector3(0, 0, 1)
			if(last_Movement == "right"):
				position = position + Vector3(1, 0, 0)
				player_AP.play("idle")
			if(last_Movement == "left"):
				position = position + Vector3(-1, 0, 0)
				player_AP.play("idle")
			last_Movement = "null"
