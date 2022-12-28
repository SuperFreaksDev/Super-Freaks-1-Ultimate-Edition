/// @description 

var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _scroll_delta = lerp(scroll_previous, scroll, frame_delta_level_get());
var _view_height = view_height_get();

event_inherited();

draw_set_color(make_colour_rgb(56, 0, 63));
draw_rectangle(view_x1_get(), view_y1_get(), view_x2_get(), view_y2_get(), false);
draw_set_color(c_white);

surface_set_target(surface);
draw_sprite_parallax_x(spr_background_lightning_clouds,, _view_x1, _view_height - 512, 2, -_scroll_delta);
draw_sprite_parallax_x(spr_background_lightning_clouds,, _view_x1, _view_height - 608, 1.5, -_scroll_delta * 3);
draw_sprite_parallax_x(spr_background_lightning_clouds,, _view_x1, _view_height - 704, 1, -_scroll_delta * 5);
draw_sprite_parallax_x(spr_background_lightning_mountains_back,, _view_x1, _view_height, 2);
draw_sprite_parallax_x(spr_background_lightning_mountains_front,, _view_x1, _view_height, 1.5);
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