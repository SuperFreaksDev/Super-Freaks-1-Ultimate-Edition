/// @description Draw

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();

if (!surface_exists(surface))
	surface = surface_create(view_width_get(), view_height_get());
else
	surface_resize(surface, view_width_get(), view_height_get());
	
//if (surface_get_target() != -1 && surface_exists(surface_get_target()))
//	surface_reset_target();

surface_set_target(surface);
draw_clear_alpha(c_white, 0);
event_user(5);
surface_reset_target();

draw_set_alpha(1);

if (background_blur_get() && shaders_are_supported())
{
	shader_set(shader_blur);
	shader_set_uniform_f(shader_get_uniform(shader_blur, "texture_size"), surface_get_width(surface), surface_get_height(surface));
	draw_surface(surface, _view_x1, _view_y1);
	shader_reset();
}
else
	draw_surface(surface, _view_x1, _view_y1);