/// @description 

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();

event_inherited();

draw_set_color(make_colour_rgb(24, 0, 35));
draw_rectangle(view_x1_get(), view_y1_get(), view_x2_get(), view_y2_get(), false);
draw_set_color(c_white);

surface_set_target(surface);
draw_sprite_parallax_x(spr_background_park,, _view_x1, view_height_get(), 2);
surface_reset_target();

if (background_blur_get() && shaders_are_supported())
{
	shader_set(shader_blur);
	shader_set_uniform_f(shader_get_uniform(shader_blur, "texture_size"), surface_get_width(surface), surface_get_height(surface));
	draw_surface(surface, _view_x1, _view_y1);
	shader_reset();
}
else
	draw_surface(surface, _view_x1, _view_y1);