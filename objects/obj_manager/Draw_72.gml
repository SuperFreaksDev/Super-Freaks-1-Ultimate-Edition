/// @description 

if (!surface_exists(global.surface_HUD))
	global.surface_HUD = surface_create(screen_width_get(), screen_height_get());
else
	surface_resize(global.surface_HUD, screen_width_get(), screen_height_get());

surface_set_target(global.surface_HUD);
draw_clear_alpha(c_black, 0);
surface_reset_target();