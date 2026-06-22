extends Node2D

## Parameters
# Board Parameters
const boardSize: int = 8
const squareWidth: int = 16
const bLeftMargin: int = 7 # Same margin as the right
const bBottomMargin: int = 7 # Same margin as the top

# Board Variable Declerations
var boardIndex: Array
var isWhite: bool
var state: bool
var moves: Array = []
var selectedUnit: Vector2

# Node References
@onready var units: Node2D = $unitNode
@onready var unitPosition: Node2D = $unitPosition
@onready var turn: Control = $playerTurn
@onready var boardSprite: Sprite2D = $boardSprite2D

# Units
const UNIT_HOLDER = preload("uid://bhgis6y6h175g")
const BLACK_PIECES = preload("uid://qf5acyexljaj")
const WHITE_PIECES = preload("uid://cvmyj61j75vhq")
const REGIONS = {
	1: Rect2(0,  0, 16, 16), # Pawn
	2: Rect2(16, 0, 16, 16), # Knight
	3: Rect2(32, 0, 16, 16), # Rook
	4: Rect2(48, 0, 16, 16), # Bishop
	5: Rect2(64, 0, 16, 16), # King
	6: Rect2(80, 0, 16, 16), # Queen
}

## Code
# Setup
func _ready() -> void:
	boardIndex.append([4, 2, 3, 5, 6, 3, 2, 4])
	boardIndex.append([1, 1, 1, 1, 1, 1, 1, 1])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([-1, -1, -1, -1, -1, -1, -1, -1])
	boardIndex.append([-4, -2, -3, -5, -6, -3, -2, -4])
	
	display_board()

# User Input
func is_mouse_out() -> bool:
	var mouse = get_global_mouse_position()
	return mouse.x < 0 or mouse.x > 142 or mouse.y > 0 or mouse.y < -142

## Function Declerations
func display_board():
	for boardRow in boardSize:
		for boardColumn in boardSize:
			## Initializing Pieces
			var unitInit = UNIT_HOLDER.instantiate()
			units.add_child(unitInit)
			unitInit.global_position = Vector2(
				bLeftMargin + (boardColumn * squareWidth) + (squareWidth/2),
				-bBottomMargin + (-boardRow * squareWidth) - (squareWidth/2)
			)
			# Assign Texture	
			# Positive = White, Negative = Black, ZERO = empty
			# {"Pawn": 1, "Knight": 2, "Bishop": 3, "Rook": 4, "Queen": 5, "King": 6}
			var value = boardIndex[boardRow][boardColumn]
			
			if value == 0:
				unitInit.texture = null
			else:
				var absValue = abs(value)
				if value > 0:
					unitInit.texture = WHITE_PIECES
				else:
					unitInit.texture = BLACK_PIECES
				unitInit.region_enabled = true
				unitInit.region_rect = REGIONS[absValue]
			
			# Assign z-index
			unitInit.z_index = 8 - boardRow
