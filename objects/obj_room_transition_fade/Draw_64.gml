/// @description 

var _screen_width = surface_get_width(application_surface);
var _screen_height = surface_get_height(application_surface);

if (!surface_exists(global.surface_HUD))
	exit;
	
surface_set_target(global.surface_HUD);
//surface_set_target(application_surface);
draw_set_color(color);
draw_set_alpha(image_alpha);
draw_rectangle(0, 0, _screen_width, _screen_height, false);
draw_set_alpha(1);
surface_reset_target();