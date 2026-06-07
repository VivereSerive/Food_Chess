class_name chessBoard
extends Node2D
### Chess Board Script

## Variable Declerations

# Board Config
const boardSize : int = 8
const bTopMargin : int = 20 # Redundant
const bBottomMargin : int = 37 # must match px height of the empty space.
const bLeftMargin : int = 7 # must match px width of the empty space.
const bRightMargin : int = 7 # must match px width of the empty space.
const squareWidth : int = 16 # must match px width of the square.
const squareHeight : int = 12 # must match px height of the square
var boardIndex : Array

# Player
var isWhiteTurn : bool # False = Black's Turn
var playerState : bool # False = Selecting Move, True = Confirmed Move

# Pieces
var pieceMove : Array = [] # All possible moves of the selected chess piece
var piecePos : Vector2 # References the position of the chess piece


## Node References
@onready var pieces: Node2D = $pieces
@onready var dots: Node2D = $dots
@onready var turn: Sprite2D = $turn

# Texture Holder
const PIECE_HOLDER = preload("uid://djgv2sh8uvyqb")

# Black
const B_BISHOP = preload("uid://b6sa1ussifsxs")
const B_KING = preload("uid://cs6hs3kbmdk0w")
const B_KNIGHT = preload("uid://d2enjrie6bk7v")
const B_PAWN = preload("uid://cjnuf1h63me8v")
const B_QUEEN = preload("uid://0k7i2h4lati")
const B_ROOK = preload("uid://bjsqov6bf52d2")

# White
const W_BISHOP = preload("uid://b4tj0dcdom42i")
const W_KING = preload("uid://cau5t7o0hvib0")
const W_KNIGHT = preload("uid://c6c1kwjf6ns8a")
const W_PAWN = preload("uid://cwjoiqmxhdbok")
const W_QUEEN = preload("uid://bpubkhoqy2mu6")
const W_ROOK = preload("uid://dfpw1ef0y54hp")

## Setup
func _ready() -> void:
	boardIndex.append([4, 2, 3, 5, 6, 3, 2, 4])
	boardIndex.append([1, 1, 1, 1, 1, 1, 1, 1])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([0, 0, 0, 0, 0, 0, 0, 0])
	boardIndex.append([-1, -1, -1, -1, -1, -1, -1, -1])
	boardIndex.append([-4, -2, -3, -5, -6, -3, -2, -4])
	
	_display_board()

## Main Loop
func _physics_process(delta: float) -> void:
	pass

## Function Declerations
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("Click")

func _display_board():
	for boardRow in boardSize:
		for boardColumn in boardSize:
			## Initializing Pieces
			var pieceInit = PIECE_HOLDER.instantiate()
			pieces.add_child(pieceInit)
			pieceInit.global_position = Vector2(
				bLeftMargin + (boardColumn * squareWidth) + (squareWidth/2),
				-bBottomMargin + (-boardRow * squareHeight) - (squareHeight/2)
			)
			# Assign Texture
			# Positive = White, Negative = Black, ZERO = empty
			# {"Pawn": 1, "Knight": 2, "Bishop": 3, "Rook": 4, "Queen": 5, "King": 6}
			match boardIndex[boardRow][boardColumn]:
				-6: pieceInit.texture = B_KING
				-5: pieceInit.texture = B_QUEEN
				-4: pieceInit.texture = B_ROOK
				-3: pieceInit.texture = B_BISHOP
				-2: pieceInit.texture = B_KNIGHT
				-1: pieceInit.texture = B_PAWN
				0: pieceInit.texture = null
				6: pieceInit.texture = W_KING
				5: pieceInit.texture = W_QUEEN
				4: pieceInit.texture = W_ROOK
				3: pieceInit.texture = W_BISHOP
				2: pieceInit.texture = W_KNIGHT
				1: pieceInit.texture = W_PAWN
			
			# Assign z-index
			match boardRow:
				0: pieceInit.z_index = 8
				1: pieceInit.z_index = 7
				2: pieceInit.z_index = 6
				3: pieceInit.z_index = 5
				4: pieceInit.z_index = 4
				5: pieceInit.z_index = 3
				6: pieceInit.z_index = 2
				7: pieceInit.z_index = 1
