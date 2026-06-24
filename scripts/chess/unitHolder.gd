extends Sprite2D

## Paramaters
var tween: Tween

# Signals
signal unitHover(unit)
signal unitClicked(unit)

# Nodes
@onready var unit_hitbox: Area2D = $unitHitbox
@onready var script_manager: Node = $scriptManager
