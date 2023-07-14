/// @description Draw Background

var _view_x1 = view_x1_get();

draw_set_color(make_colour_rgb(24, 0, 35));
draw_rectangle(0, 0, surface_get_width(surface), surface_get_height(surface), false);
draw_set_color(c_white);
draw_sprite_parallax_x(spr_background_stadium,, _view_x1, view_height_get(), 2);