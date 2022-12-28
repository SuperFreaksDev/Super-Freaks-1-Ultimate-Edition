var _frame = frame;
var _effect = effect;

var _game_width = surface_get_width(application_surface);
var _game_height = surface_get_height(application_surface);

if (!surface_exists(surface))
	surface = surface_create(_game_width, _game_height);
else
{
	surface_resize(surface, _game_width, _game_height);
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
}

surface_set_target(surface);
draw_surface(application_surface, 0, 0);
surface_reset_target();
if (shaders_are_supported())
{
	shader_set(shader_wave);
	shader_set_uniform_f(shader_get_uniform(shader_wave, "time"), _frame);
	shader_set_uniform_f(shader_get_uniform(shader_wave, "size"), 0.0015 * _effect);
}
draw_surface_stretched(surface, view_x1_get(), view_y1_get(), view_width_get(), view_height_get());
if (shaders_are_supported())
	shader_reset();
draw_set_color(c_orange);
draw_set_alpha(0.4 * _effect);
draw_rectangle(view_x1_get(), view_y1_get(), view_x2_get(), view_y2_get(), false);
draw_set_alpha(1);
draw_set_color(c_white);