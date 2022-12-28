/// @description 

var _width = image_xscale * sprite_get_width(sprite_index);
var _height = image_yscale * sprite_get_height(sprite_index);
var _width_half = _width / 2;

if (state == 0)
	draw_sprite_stretched(spr_platform_fan_wind, image_index, x - _width_half + 8, y - _height, _width - 16, _height);
draw_sprite_interpolated(sprite_index, image_index,,,,, image_xscale, 1);