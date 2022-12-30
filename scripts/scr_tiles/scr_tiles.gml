#macro TILE_SIZE 32
#macro TILE_SIZE_DIV 5 //bit shifting right by this number divides by 32 (ex. 32 >> 5 = 1); bit shifting left will instead multiply by 32 (ex. 1 << 5 = 32)
#macro ANGLE_FLAT 361

#macro TILE_LAYER_A 0
#macro TILE_LAYER_B 1

enum tile_data
{
	behavior = 0,
	solid_type,
	solid_x1,
	solid_y1,
	solid_x2,
	solid_y2,
	shape,
	shape_x1,
	shape_y1,
	shape_x2,
	shape_y2,
	angle,
	slope,
}

enum tile_solidity
{
	NA = 0,
	solid_flat,
	solid_slope,
	solid_support,
}

enum tile_shapes
{
	full = 0,
	AABB,
	line,
}

/// @function tile_data_arrays_init
function tile_data_arrays_init()
{
	var _i;
	global.tile_data_array_level = array_create(255);
		
	for (_i = 0; _i < 256; ++_i)
	{
		global.tile_data_array_level[_i] = array_create(14, 0);
	}
}

/// @function tile_data_set
/// @param {array} _tile_data_array
/// @param {int} _index
/// @param {int} _behavior = collider_behaviors_solid.NA
/// @param {int} _solid_type = tile_solidity.solid_flat
/// @param {boolean} _solid_x1 = true
/// @param {boolean} _solid_y1 = true
/// @param {boolean} _solid_x2 = true
/// @param {boolean} _solid_y2 = true
/// @param {int} _shape = tile_shapes.full
/// @param {float} _shape_x1 = 0
/// @param {float} _shape_y1 = 0
/// @param {float} _shape_x2 = TILE_SIZE - 1
/// @param {float} _shape_y2 = TILE_SIZE - 1
/// @param {float} _angle = 0
/// @param {float} _slope = 0
function tile_data_set(_tile_data_array, _index, _behavior = collider_behaviors_solid.NA, _solid_type = tile_solidity.solid_flat, _solid_x1 = true, _solid_y1 = true, _solid_x2 = true, _solid_y2 = true, _shape = tile_shapes.full, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = TILE_SIZE - 1, _shape_y2 = 0, _angle = point_direction(_shape_x1, _shape_y1, _shape_x2, _shape_y2), _slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1))
{
	_tile_data_array[_index][tile_data.behavior] = _behavior;
	_tile_data_array[_index][tile_data.solid_type] = _solid_type;
	_tile_data_array[_index][tile_data.solid_x1] = _solid_x1;
	_tile_data_array[_index][tile_data.solid_y1] = _solid_y1;
	_tile_data_array[_index][tile_data.solid_x2] = _solid_x2;
	_tile_data_array[_index][tile_data.solid_y2] = _solid_y2;
	_tile_data_array[_index][tile_data.shape] = _shape;
	_tile_data_array[_index][tile_data.shape_x1] = _shape_x1;
	_tile_data_array[_index][tile_data.shape_y1] = _shape_y1;
	_tile_data_array[_index][tile_data.shape_x2] = _shape_x2;
	_tile_data_array[_index][tile_data.shape_y2] = _shape_y2;
	_tile_data_array[_index][tile_data.angle] = _angle;
	_tile_data_array[_index][tile_data.slope] = _slope;
}

/// @function tile_data_array_level_default
function tile_data_array_level_default()
{
	var _tile_data_array = global.tile_data_array_level;
	
	tile_data_set(_tile_data_array, 0, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Blank Tile
	tile_data_set(_tile_data_array, 1, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Common Tile
	tile_data_set(_tile_data_array, 2, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 31, 31, 0); //Slope 45 Degrees Bottom Left to Top Right
	tile_data_set(_tile_data_array, 3, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 0, 31, 31); //Slope 315 Degrees Top Left to Bottom Right
	tile_data_set(_tile_data_array, 4, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor Left Corner - Top
	tile_data_set(_tile_data_array, 5, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor - Top
	tile_data_set(_tile_data_array, 6, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor Right Corner - Top
	tile_data_set(_tile_data_array, 7, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor Block - Top
	tile_data_set(_tile_data_array, 8, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Decoration Tile
	
	tile_data_set(_tile_data_array, 9, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 45 Degrees Bottom Left to Top Right - Top
	tile_data_set(_tile_data_array, 10, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 315 Degrees Top Left to Bottom Right - Top
	tile_data_set(_tile_data_array, 11, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 45 Degrees Bottom Left to Top Right - Support
	tile_data_set(_tile_data_array, 12, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 315 Degrees Top Left to Bottom Right - Support
	tile_data_set(_tile_data_array, 13, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, false, false,,,,,, ANGLE_FLAT, 0); //Floor Left Corner
	tile_data_set(_tile_data_array, 14, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false,,,,,, 0, 0); //Floor
	tile_data_set(_tile_data_array, 15, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, true, false,,,,,, ANGLE_FLAT, 0); //Floor Right Corner
	tile_data_set(_tile_data_array, 16, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, true, false,,,,,, ANGLE_FLAT, 0); //Block Vertical Top
	tile_data_set(_tile_data_array, 17, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Bottom Left Inner Corner
	
	tile_data_set(_tile_data_array, 18, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 31, 31, 16); //Slope 22.5 Degrees Bottom Left to Top Right (1/2)
	tile_data_set(_tile_data_array, 19, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 15, 31, 0); //Slope 22.5 Degrees Bottom Left to Top Right (2/2)
	tile_data_set(_tile_data_array, 20, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 0, 31, 15); //Slope 337.5 Degrees Top Left to Bottom Right (1/2)
	tile_data_set(_tile_data_array, 21, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 16, 31, 31); //Slope 337.5 Degrees Top Left to Bottom Right (2/2)
	tile_data_set(_tile_data_array, 22, collider_behaviors_solid.NA, tile_solidity.solid_slope, true, false, false, false,,,,,, 90, 0); //Wall - Left
	tile_data_set(_tile_data_array, 23, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Decoration Tile
	tile_data_set(_tile_data_array, 24, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, false, true, false,,,,,, 270, 0); //Wall - Right
	tile_data_set(_tile_data_array, 25, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, false, true, false,,,,,, ANGLE_FLAT, 0); //Block Vertical
	tile_data_set(_tile_data_array, 26, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Top Left Inner Corner
	
	tile_data_set(_tile_data_array, 27, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 22.5 Degrees Bottom Left to Top Right - Support
	tile_data_set(_tile_data_array, 28, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 22.5 Degrees Bottom Left to Top Right - Top
	tile_data_set(_tile_data_array, 29, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 337.5 Degrees Top Left to Bottom Right - Top
	tile_data_set(_tile_data_array, 30, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 337.5 Degrees Bottom Left to Top Right - Support
	tile_data_set(_tile_data_array, 31, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, false, false, true,,,,,, ANGLE_FLAT, 0); //Ceiling Left Corner
	tile_data_set(_tile_data_array, 32, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, false, false, true,,,,,, 180, 0); //Ceiling
	tile_data_set(_tile_data_array, 33, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, false, true, true,,,,,, ANGLE_FLAT, 0); //Ceiling Right Corner
	tile_data_set(_tile_data_array, 34, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, false, true, true,,,,,, ANGLE_FLAT, 0); //Block Vertical Bottom
	tile_data_set(_tile_data_array, 35, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Bottom Right Inner Corner
	
	tile_data_set(_tile_data_array, 36, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Left Corner
	tile_data_set(_tile_data_array, 37, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Middle
	tile_data_set(_tile_data_array, 38, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Right Corner
	tile_data_set(_tile_data_array, 39, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Single
	tile_data_set(_tile_data_array, 40, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, false, true,,,,,, ANGLE_FLAT, 0); //Block Horizontal Left
	tile_data_set(_tile_data_array, 41, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, true,,,,,, ANGLE_FLAT, 0); //Block Horizontal Middle
	tile_data_set(_tile_data_array, 42, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, true, true,,,,,, ANGLE_FLAT, 0); //Block Horizontal Right
	tile_data_set(_tile_data_array, 43, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, true, true,,,,,, ANGLE_FLAT, 0); //Block Single
	tile_data_set(_tile_data_array, 44, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Top Right Inner Corner
}
