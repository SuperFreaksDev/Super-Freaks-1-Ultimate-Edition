/// @description Draw

if (!surface_exists(surface))
	surface = surface_create(view_width_get(), view_height_get());
else
{
	surface_resize(surface, view_width_get(), view_height_get());
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
}