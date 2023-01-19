/// @description 

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _scroll_delta = lerp(scroll_previous, scroll, frame_delta_level_get());
var _sky_color_top, _sky_color_bottom;

event_inherited();

if (alternate)
{
	_sky_color_top = make_color_rgb(255, 191, 236);
	_sky_color_bottom = make_color_rgb(255, 127, 217);
}
else
{
	_sky_color_top = make_color_rgb(255, 173, 0);
	_sky_color_bottom = c_orange;
}
draw_rectangle_color(view_x1_get(), view_y1_get(), view_x2_get(), view_y2_get(), _sky_color_top, _sky_color_top, _sky_color_bottom, _sky_color_bottom, false);
draw_set_color(c_white);

surface_set_target(surface);
//draw
draw_sprite_parallax_x(spr_background_hippie_clouds,, _view_x1, view_height_get() - 64, 2, -_scroll_delta);
draw_sprite_parallax_x(spr_background_hippie_flowers,, _view_x1, view_height_get(), 1.75, 0);
draw_sprite_parallax_x(spr_background_hippie_clouds,, _view_x1, view_height_get() - 32, 1.5, -_scroll_delta * 3);
draw_sprite_parallax_x(spr_background_hippie_clouds,, _view_x1, view_height_get(), 1, -_scroll_delta * 5);
shader_reset();
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