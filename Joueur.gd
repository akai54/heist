extends "res://Personnages/ModèlePersonnage.gd"

var mouvement = Vector2()

# Preferable d'utiliser _physics_process(delta),
# car on utilise un KinematicBody2D.

func _physics_process(delta):
	maj_mouvement()
	move_and_slide(mouvement)

func maj_mouvement():
	# clamp Fixe la valeur et renvoie une valeur non inférieure à min et pas supérieure à max.
	if Input.is_action_pressed("se_déplacer_vers_le_bas") and not Input.is_action_pressed("se_déplacer_vers_le_haut") :
		mouvement.y = clamp(mouvement.y + VITESSE, 0, VITESSE_MAX)
	elif Input.is_action_pressed("se_déplacer_vers_le_haut") and not Input.is_action_pressed("se_déplacer_vers_le_bas") :
		mouvement.y = clamp(mouvement.y - VITESSE, -VITESSE_MAX, 0)
	else:
		mouvement.y = 0

	if Input.is_action_pressed("se_déplacer_vers_la_gauche") and not Input.is_action_pressed("se_déplacer_vers_la_droite") :
		mouvement.x = clamp(mouvement.x - VITESSE, -VITESSE_MAX, 0)
	elif Input.is_action_pressed("se_déplacer_vers_la_droite") and not Input.is_action_pressed("se_déplacer_vers_la_gauche") :
		mouvement.x = clamp(mouvement.x + VITESSE, 0, VITESSE_MAX)
	else:
		mouvement.x = 0
