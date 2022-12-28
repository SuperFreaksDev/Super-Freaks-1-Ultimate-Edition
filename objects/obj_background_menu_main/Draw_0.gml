/// @description 

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _scroll_delta = lerp(scroll_previous, scroll, global.frame_delta);

event_inherited();

surface_set_target(surface);
draw_set_alpha(1);
draw_set_color(c_white);
draw_sprite_tiled(spr_menu_main_background, 0, _scroll_delta, _scroll_delta);
draw_set_alpha(0.5);
draw_rectangle(_view_x1, _view_y1, view_x2_get(), view_y2_get(), false);
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