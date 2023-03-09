/// @description 

var _width = abs(image_xscale * sprite_get_width(sprite_index));
var _height = abs(image_yscale * sprite_get_height(sprite_index));
var _width_half = _width / 2;

draw_sprite_stretched(spr_metal_box_spawner, 0, x - _width_half - 8, y - _height - 8, _width + 16, _height + 16);