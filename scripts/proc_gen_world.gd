extends Node2D

@export var noise_texture : NoiseTexture2D
var noise : Noise

var width : int = 400
var height : int = 400

@onready var tile_map = $TileMap

var source_id = 0
var water_atlas = Vector2i(0,1)
var land_atlas = Vector2i (0,0)

func _ready():
	noise = noise_texture.noise
	generate_world()
	
func generate_world():
	for x in range(width):
		for y in range (height):
			var noise_val = noise.get_noise_2d(x,y)
			if noise_val >= 0.0:
				tile_map.set_cell(0, Vector2i(x,y), source_id, land_atlas)
			elif noise_val < 0.0:
				tile_map.set_cell(0, Vector2i(x,y), source_id, water_atlas)
				
