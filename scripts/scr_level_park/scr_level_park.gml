/// @function tile_data_array_level_park
function tile_data_array_level_park()
{
	var _tile_data_array = global.tile_data_array_level;
	
	//Normal Tiles
	tile_data_set(_tile_data_array, 0, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Blank Tile
	tile_data_set(_tile_data_array, 1, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Common Tile
	tile_data_set(_tile_data_array, 2, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, true, true,,,,,, ANGLE_FLAT, 0); //Block Single
	tile_data_set(_tile_data_array, 3, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, false, true,,,,,, ANGLE_FLAT, 0); //Block Horizontal Left
	tile_data_set(_tile_data_array, 4, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, true,,,,,, ANGLE_FLAT, 0); //Block Horizontal Middle
	tile_data_set(_tile_data_array, 5, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, true, true,,,,,, ANGLE_FLAT, 0); //Block Horizontal Right
	tile_data_set(_tile_data_array, 6, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, true, false,,,,,, ANGLE_FLAT, 0); //Block Vertical Top
	tile_data_set(_tile_data_array, 7, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, false, true, false,,,,,, ANGLE_FLAT, 0); //Block Vertical
	tile_data_set(_tile_data_array, 8, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, false, true, true,,,,,, ANGLE_FLAT, 0); //Block Vertical Bottom
	tile_data_set(_tile_data_array, 9, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, true, false, false,,,,,, ANGLE_FLAT, 0); //Floor Left Corner
	tile_data_set(_tile_data_array, 10, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false,,,,,, 0, 0); //Floor
	tile_data_set(_tile_data_array, 11, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, true, false,,,,,, ANGLE_FLAT, 0); //Floor Right Corner
	tile_data_set(_tile_data_array, 12, collider_behaviors_solid.NA, tile_solidity.solid_flat, true, false, false, true,,,,,, ANGLE_FLAT, 0); //Ceiling Left Corner
	tile_data_set(_tile_data_array, 13, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, false, false, true,,,,,, 180, 0); //Ceiling
	tile_data_set(_tile_data_array, 14, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, false, true, true,,,,,, ANGLE_FLAT, 0); //Ceiling Right Corner
	tile_data_set(_tile_data_array, 15, collider_behaviors_solid.NA, tile_solidity.solid_slope, true, false, false, false,,,,,, 90, 0); //Wall - Left
	
	tile_data_set(_tile_data_array, 16, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, false, true, false,,,,,, 270, 0); //Wall - Right
	tile_data_set(_tile_data_array, 17, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Top Left Inner Corner
	tile_data_set(_tile_data_array, 18, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Top Right Inner Corner
	tile_data_set(_tile_data_array, 19, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Bottom Right Inner Corner
	tile_data_set(_tile_data_array, 20, collider_behaviors_non_solid.NA, tile_solidity.NA, false, false, false, false); //Bottom Left Inner Corner
	tile_data_set(_tile_data_array, 21, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 45 Degrees Bottom Left to Top Right - Top
	tile_data_set(_tile_data_array, 22, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 31, 31, 0); //Slope 45 Degrees Bottom Left to Top Right
	tile_data_set(_tile_data_array, 23, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 45 Degrees Bottom Left to Top Right - Support
	tile_data_set(_tile_data_array, 24, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 315 Degrees Top Left to Bottom Right - Support
	tile_data_set(_tile_data_array, 25, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 0, 31, 31); //Slope 315 Degrees Top Left to Bottom Right
	tile_data_set(_tile_data_array, 26, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 315 Degrees Top Left to Bottom Right - Top
	tile_data_set(_tile_data_array, 27, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 22.5 Degrees Bottom Left to Top Right - Top
	tile_data_set(_tile_data_array, 28, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 31, 31, 16); //Slope 22.5 Degrees Bottom Left to Top Right (1/2)
	tile_data_set(_tile_data_array, 29, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 15, 31, 0); //Slope 22.5 Degrees Bottom Left to Top Right (2/2)
	tile_data_set(_tile_data_array, 30, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 22.5 Degrees Bottom Left to Top Right - Support
	tile_data_set(_tile_data_array, 31, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Slope 337.5 Degrees Bottom Left to Top Right - Support
	
	tile_data_set(_tile_data_array, 32, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 0, 31, 15); //Slope 337.5 Degrees Top Left to Bottom Right (1/2)
	tile_data_set(_tile_data_array, 33, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 16, 31, 31); //Slope 337.5 Degrees Top Left to Bottom Right (2/2)
	tile_data_set(_tile_data_array, 34, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Slope 337.5 Degrees Top Left to Bottom Right - Top
	tile_data_set(_tile_data_array, 35, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Single
	tile_data_set(_tile_data_array, 36, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Left Corner
	tile_data_set(_tile_data_array, 37, collider_behaviors_solid.NA, tile_solidity.solid_slope, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Middle
	tile_data_set(_tile_data_array, 38, collider_behaviors_solid.NA, tile_solidity.solid_flat, false, true, false, false,,,,,, 0, 0); //Floor Semi Solid Right Corner
	tile_data_set(_tile_data_array, 39, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor Block - Top
	tile_data_set(_tile_data_array, 40, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor Left Corner - Top
	tile_data_set(_tile_data_array, 41, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor - Top
	tile_data_set(_tile_data_array, 42, collider_behaviors_non_solid.floor_top, tile_solidity.NA, false, false, false, false); //Floor Right Corner - Top
	tile_data_set(_tile_data_array, 43, collider_behaviors_solid.rail_right, tile_solidity.solid_slope, false, true, false, false,,,,,, 0, 0); //Rail Right
	tile_data_set(_tile_data_array, 44, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Rail Right Slope 337.5 Degrees Top Left to Bottom Right - Support
	tile_data_set(_tile_data_array, 45, collider_behaviors_solid.rail_right, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 0, 31, 15); //Rail Right Slope 337.5 Degrees Top Left to Bottom Right (1/2)
	tile_data_set(_tile_data_array, 46, collider_behaviors_solid.rail_right, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 16, 31, 31); //Rail Right Slope 337.5 Degrees Top Left to Bottom Right (2/2)
	tile_data_set(_tile_data_array, 47, collider_behaviors_solid.rail_right, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 31, 31, 16); //Rail Right Slope 22.5 Degrees Bottom Left to Top Right (1/2)
	
	tile_data_set(_tile_data_array, 48, collider_behaviors_solid.rail_right, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 15, 31, 0); //Rail Right Slope 22.5 Degrees Bottom Left to Top Right (2/2)
	tile_data_set(_tile_data_array, 49, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Rail Right Slope 22.5 Degrees Bottom Left to Top Right - Support
	tile_data_set(_tile_data_array, 50, collider_behaviors_solid.rail_left, tile_solidity.solid_slope, false, true, false, false,,,,,, 0, 0); //Rail Left
	tile_data_set(_tile_data_array, 51, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Rail Left Slope 337.5 Degrees Top Left to Bottom Right - Support
	tile_data_set(_tile_data_array, 52, collider_behaviors_solid.rail_left, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 0, 31, 15); //Rail Left Slope 337.5 Degrees Top Left to Bottom Right (1/2)
	tile_data_set(_tile_data_array, 53, collider_behaviors_solid.rail_left, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 16, 31, 31); //Rail Left Slope 337.5 Degrees Top Left to Bottom Right (2/2)
	tile_data_set(_tile_data_array, 54, collider_behaviors_solid.rail_left, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 31, 31, 16); //Rail Left Slope 22.5 Degrees Bottom Left to Top Right (1/2)
	tile_data_set(_tile_data_array, 55, collider_behaviors_solid.rail_left, tile_solidity.solid_slope, false, true, false, false, tile_shapes.line, 0, 15, 31, 0); //Rail Left Slope 22.5 Degrees Bottom Left to Top Right (2/2)
	tile_data_set(_tile_data_array, 56, collider_behaviors_non_solid.NA, tile_solidity.solid_support, false, true, false, false); //Rail Left Slope 22.5 Degrees Bottom Left to Top Right - Support
}