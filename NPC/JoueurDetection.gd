extends "res://Personnages/ModèlePersonnage.gd"

const FOV_TOLERANCE = 20
const ROUGE = Color(1,0.25,0.25)
const BLANC = Color(1,1,1)

var Joueur

func _ready():
	Joueur = get_node("/root").find_node("Joueur", true, false)

func _process(delta):
	if Joueur_in_FOV() and Joueur_in_LDM():
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

# Ligne De Mire.
func Joueur_in_LDM():
	
	#get_world_2d() = Tout ce qui concerne l'environnement 2D (son, physique, etc.)
	#direct_space_state = L'état Physique - permet des demandes de collision arbitraires.
	var espace = get_world_2d().direct_space_state
	var LDM_obstacle = espace.intersect_ray(global_position, Joueur.global_position, [self], collision_mask)
	
	if not LDM_obstacle:
		return false
	
	var distance_to_Joueur = Joueur.global_position.distance_to(global_position)
	
	if LDM_obstacle.collider == Joueur:
		return true
	else:
		return false
