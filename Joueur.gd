extends "res://Personnages/ModèlePersonnage.gd"

var mouvement = Vector2()

# Preferable d'utiliser _physics_process(delta),
# car on utilise un KinematicBody2D.

func _physics_process(delta):
	update_mouvement()
	move_and_slide(mouvement)

func update_mouvement():
	if Input.is_action_pressed("se_déplacer_vers_le_bas") and not Input.is_action_pressed("se_déplacer_vers_le_haut") :
		mouvement.y += VITESSE
	elif Input.is_action_pressed("se_déplacer_vers_le_haut") and not Input.is_action_pressed("se_déplacer_vers_le_bas") :
		mouvement.y -= VITESSE
	else:
		mouvement.y = 0

	if Input.is_action_pressed("se_déplacer_vers_la_gauche") and not Input.is_action_pressed("se_déplacer_vers_la_droite") :
		mouvement.x -= VITESSE
	elif Input.is_action_pressed("se_déplacer_vers_la_droit") and not Input.is_action_pressed("se_déplacer_vers_la_gauche") :
		mouvement.x += VITESSE
	else:
		mouvement.x = 0
