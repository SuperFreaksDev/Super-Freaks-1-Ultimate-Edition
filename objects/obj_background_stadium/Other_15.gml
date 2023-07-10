/// @description Draw Background

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _view_x2 = view_x2_get();
var _view_y2 = view_y2_get();

draw_set_color(make_colour_rgb(24, 0, 35));
draw_rectangle(_view_x1, _view_y1, _view_x2, _view_y2, false);
draw_set_color(c_white);
draw_sprite_parallax_x(spr_background_stadium,, _view_x1, view_height_get(), 2);