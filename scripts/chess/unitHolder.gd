extends Sprite2D

## Paramaters
var tween: Tween

# Signals
signal unitClicked(unit)

# Nodes	
@onready var unit_hitbox: Area2D = $unitHitbox
@onready var script_manager: Node = $scriptManager
@onready var unit_anim: Node = $scriptManager/unitAnim
@onready var unit_input: Node = $scriptManager/unitInput
