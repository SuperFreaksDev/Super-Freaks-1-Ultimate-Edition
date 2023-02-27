/// @description Init

var _width = abs(image_xscale * sprite_get_width(sprite_index));
var _height = abs(image_yscale * sprite_get_height(sprite_index));
var _width_half = _width / 2;
var _height_half = _height / 2;

// Inherit the parent event
event_inherited();

collider = new comp_collider_AABB(,, -_width / 2, -_height, _width / 2, 0);
with (collider)
{
	solid_x1 = collider_solidity.solid;
	solid_y1 = collider_solidity.solid;
	solid_x2 = collider_solidity.solid;
	solid_y2 = collider_solidity.solid;
}

ground_on = false;
speed_grv = 0.25;

collider_detector_sides_set(-_height + 8, -_height_half, -8, _height_half, _width);
collider_detector_up_set(-_width_half + 8, 0, _width_half - 8, 0, -_height);
collider_detector_down_set(-_width_half + 4, 0, _width_half - 4, 0, 0);