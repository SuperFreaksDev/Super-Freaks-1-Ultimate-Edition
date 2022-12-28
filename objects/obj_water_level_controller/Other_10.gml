/// @description Step

var _water_central = (height_min + height_max) / 2;
var _water_distance = height_max - height_min;

water_level += height_speed;
if (water_level < 0)
	water_level += 360;
else
	water_level = water_level mod 360;

global.water_height = _water_central + lengthdir_y(_water_distance, water_level);