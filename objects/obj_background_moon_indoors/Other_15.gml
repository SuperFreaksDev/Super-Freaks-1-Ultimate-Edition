/// @description Draw Background

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _view_width = view_width_get();
var _view_height = view_height_get();

draw_sprite_tiled(spr_moon_back_indoors, alternate, (_view_x1 / 1.25) - _view_x1, (_view_y1 / 1.25) - _view_y1);

draw_set_alpha(fade_effect);
draw_set_color(c_black);
draw_rectangle(0, 0, _view_width, _view_height, false);
draw_set_alpha(1);
draw_set_color(c_white);