/// @description 

var _i;
var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _view_width = view_width_get();
var _view_height = view_height_get();

if (state != 4)
	exit;

draw_set_projection_2D(_view_x1, _view_y1, _screen_width, _screen_height);
draw_set_alpha(1);

if (level_id > -1)
{
	text_world = level_name_world_get(level_id);
	text_level = level_name_get(level_id);
	trophies = level_trophies_get(level_id);
	trophies_max = level_trophy_count_max_get(level_id);
}
else
{
	text_world = "";
	text_level = "";
	trophies = 0;
	trophies_max = 0;
}

draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(global.font_16);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text(_view_x1 + _screen_width, _view_y1, string_upper(text_world) + "\n" + string_upper(text_level));

for (_i = 0; _i < trophies_max; ++_i)
{
	draw_sprite(spr_HUD_trophy, bit_get(trophies, _i), _view_x1 + _screen_width - (trophies_max * 32) + _i * 32, _view_y1 + 32);
}

draw_set_valign(fa_middle);
draw_action(0, controls_actions.jump, _view_x1 + _screen_width - 8, _view_y1 + _screen_height - 24);
draw_text(_view_x1 + _screen_width - 16, _view_y1 + _screen_height - 24, "Play Level");
draw_action(0, controls_actions.attack, _view_x1 + _screen_width - 8, _view_y1 + _screen_height - 8);
draw_text(_view_x1 + _screen_width - 16, _view_y1 + _screen_height - 8, "Main Menu");

draw_set_projection_2D(_view_x1, _view_y1, _view_width, _view_height);