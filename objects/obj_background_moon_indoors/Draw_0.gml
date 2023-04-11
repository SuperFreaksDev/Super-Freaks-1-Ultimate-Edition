/// @description 

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();

event_inherited();

surface_set_target(surface);
draw_sprite_tiled(spr_moon_back_indoors, alternate, 0, 0);
surface_reset_target();

if (background_blur_get())
{
	shader_set(shader_blur);
	shader_set_uniform_f(shader_get_uniform(shader_blur, "texture_size"), surface_get_width(surface), surface_get_height(surface));
	draw_surface(surface, _view_x1, _view_y1);
	shader_reset();
}
else
	draw_surface(surface, _view_x1, _view_y1);