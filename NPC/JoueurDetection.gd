extends "res://Personnages/ModèlePersonnage.gd"

const FOV_TOLERANCE = 20
const ROUGE = Color(1,0.25,0.25)
const BLANC = Color(1,1,1)

var Joueur

func _ready():
	Joueur = get_node("/root").find_node("Joueur", true, false)

func _process(delta):
	if Joueur_in_FOV():
		$Torche.color = ROUGE
	else:
		$Torche.color = BLANC

func Joueur_in_FOV():
	var npc_facing_direction = Vector2(1,0).rotated(global_rotation)
	var direction_to_Joueur = (Joueur.position - global_position).normalized()
	
	if abs(direction_to_Joueur.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false
