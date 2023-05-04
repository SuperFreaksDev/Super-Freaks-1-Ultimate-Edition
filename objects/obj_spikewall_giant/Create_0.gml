/// @description Init

var _width, _height, _width_half, _height_half, _target_x, _target_y;

image_xscale = abs(image_xscale);
image_yscale = abs(image_yscale);

_width = sprite_get_width(sprite_index) * image_xscale;
_height = sprite_get_height(sprite_index) * image_yscale;
_width_half = _width / 2;
_height_half = _height / 2;

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_AABB(,,,,, -_width_half, -_height_half, _width_half, _height_half);

can_despawn = false;
animate_speed = abs(speed_move) * 0.125;
speed_extra = 0;


if (global.checkpoint[spawn_point_data.go_to_checkpoint] == true)
{
	_target_x = global.checkpoint[spawn_point_data.x];
	_target_y = global.checkpoint[spawn_point_data.y];
}
else	
{
	_target_x = global.spawn_point[spawn_point_data.x];
	_target_y = global.spawn_point[spawn_point_data.y];
}

switch (move_direction)
{
	case "Left":
		if (!is_undefined(_target_x))
			x = _target_x + _width_half + 512;
		break;
	case "Up":
		if (!is_undefined(_target_y))
			y = _target_y + _height_half + 512;
		break;
	case "Right":
		if (!is_undefined(_target_x))
			x = _target_x - _width_half - 512;
		break;
	case "Down":
		if (!is_undefined(_target_y))
			y = _target_y - _height_half - 512;
		break;
}